class AddDetailsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date, :datetime
    add_column :events, :open_time, :time
    add_column :events, :start_time_, :time
    add_column :events, :door_price, :integer
    add_column :events, :adv_drink, :integer
    add_column :events, :door_drink_integer, :string
  end
end
