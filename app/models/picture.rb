class Picture < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  attr_accessible :caption, :picture, :sent_date, :user_name, :event_name
end
