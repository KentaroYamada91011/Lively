class AddColumnsToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :uid, :string
    add_column :artists, :provider, :string
  end
end
