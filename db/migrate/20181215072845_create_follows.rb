class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :artist_id

      t.timestamps
    end
    add_index :follows, :user_id
    add_index :follows, :artist_id
    add_index :follows, [:user_id, :artist_id], unique: true
  end
end
