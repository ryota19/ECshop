class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer "sell_id"
      t.integer "order_id"
      t.integer "product_id"
      t.integer "quantity"
      t.integer "price"
      t.integer "status", default: 0

      t.timestamps
    end
  end
end
