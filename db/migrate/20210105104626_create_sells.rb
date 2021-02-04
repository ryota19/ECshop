class CreateSells < ActiveRecord::Migration[5.2]
  def change
    create_table :sells do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
