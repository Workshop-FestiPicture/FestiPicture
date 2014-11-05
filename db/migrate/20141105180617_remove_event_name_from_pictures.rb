class RemoveEventNameFromPictures < ActiveRecord::Migration
  def up
  	change_table :pictures do |t|
  		t.remove :user_name, :event_name
  		t.belongs_to :user
  		t.belongs_to :event
  	end
  end
end
