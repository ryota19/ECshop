class AddAdminToSells < ActiveRecord::Migration[5.2]
  def change
    add_column :sells, :admin, :boolean, default: false, null: false 
  end
end
