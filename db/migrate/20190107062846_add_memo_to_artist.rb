class AddMemoToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :memo, :string
  end
end
