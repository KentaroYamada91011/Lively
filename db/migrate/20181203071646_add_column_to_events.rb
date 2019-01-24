class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_id, :string
  end
end
