class ChangeSellsToSeller < ActiveRecord::Migration[5.2]
  def change
    rename_table :sells, :sellers
    rename_column :carts, :sell_id, :seller_id
    rename_column :orders, :sell_id, :seller_id
    rename_column :order_products, :sell_id, :seller_id
  end
end
