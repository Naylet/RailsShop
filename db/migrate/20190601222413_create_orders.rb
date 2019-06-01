class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.belongs_to :users, foreign_key: true

      t.timestamps
    end
  end
end
