class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items, id: :integer do |t|
      t.integer :quantity, default: 0
      t.integer :product_id, foreign_key: true
      t.integer :cart_id, foreign_key: true

      t.timestamps
    end
  end
end
