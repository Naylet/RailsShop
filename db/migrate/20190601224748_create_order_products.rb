class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.belongs_to :products, foreign_key: true
      t.belongs_to :orders, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
