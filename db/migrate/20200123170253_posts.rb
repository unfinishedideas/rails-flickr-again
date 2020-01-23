class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column(:user_id, :int)

      t.column(:title, :string)
      t.column(:description, :string)
      t.column(:tagged_id, :int)

      t.timestamps
    end
  end
end
