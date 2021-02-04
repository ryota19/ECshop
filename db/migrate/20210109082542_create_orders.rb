class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :status, default: 0
      t.integer :sell_id

      t.timestamps
    end
  end
end
