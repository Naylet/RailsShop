class AddUnitPriceToLineItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :line_items, :unit_price
    add_column :line_items, :unit_price, :decimal, precision: 10, scale: 2
  end
end
