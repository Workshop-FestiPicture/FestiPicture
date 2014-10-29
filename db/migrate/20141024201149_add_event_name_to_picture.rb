class AddEventNameToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :event_name, :string
  end
end
