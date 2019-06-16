class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy

  def current_user_cart
    "cart#{id}"
  end

  def add_to_cart(product_id)
    $redis.hincrby current_user_cart, product_id, 1
  end

  def remove_from_cart(product_id)
    $redis.hdel current_user_cart, product_id
  end

  def remove_one_from_cart(product_id)
    $redis.hincrby current_user_cart, product_id, -1

    if ($redis.hget current_user_cart, product_id)=="0"
      $redis.hdel current_user_cart, product_id
    end
  end

  def cart_count
    quantities = $redis.hvals "cart#{id}"
    quantities.reduce(0) { |sum ,qty| sum + qty.to_i }
  end

  def cart_total_price
    get_cart_products_with_qty.map { |product, qty| product.price * qty.to_i}.reduce(:+)
  end

  def get_cart_products_with_qty
    cart_ids = []
    cart_qtys = []

    ($redis.hgetall current_user_cart).map do |key, value|
      cart_ids << key
      cart_qtys << value
    end

    cart_products = Product.find(cart_ids)
    cart_products.zip(cart_qtys)
  end

  def purchase_cart_products
    order = self.orders.create(user: self, order_date: Time.now)
    get_cart_products_with_qty.each do |product, qty|
      order.line_items.create(order_id: order.id, product_id: product.id, quantity: qty, unit_price: product.price)
    end
    $redis.del current_user_cart
  end
end
