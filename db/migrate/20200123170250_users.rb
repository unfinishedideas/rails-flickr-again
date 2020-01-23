class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string

      t.column(:username, :string)
      t.column(:fav_img_id, :int)

      t.timestamps
    end
  end
end
