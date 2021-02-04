class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts, id: :integer do |t|
      t.integer :sell_id, foreign_key: true

      t.timestamps
    end
  end
end
