json.extract! order_product, :id, :products_id, :orders_id, :quantity, :created_at, :updated_at
json.url order_product_url(order_product, format: :json)
