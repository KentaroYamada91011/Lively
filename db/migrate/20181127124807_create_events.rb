class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :artist, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.integer :price
      t.string :memo
      t.string :image

      t.timestamps
    end
  end
end
