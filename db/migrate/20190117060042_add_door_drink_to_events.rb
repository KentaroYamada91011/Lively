class AddDoorDrinkToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :door_drink, :integer
  end
end
