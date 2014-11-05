class Picture < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  attr_accessible :caption, :picture, :sent_date, :event_id, :user_id
end
