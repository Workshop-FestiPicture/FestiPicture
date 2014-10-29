class Event < ActiveRecord::Base
  attr_accessible :description, :ending_date, :image, :name, :opening_date
  has_many :pictures
end
