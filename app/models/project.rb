class Project < ActiveRecord::Base
  has_many :features
  accepts_nested_attributes_for :features
  belongs_to :user

  extend SimpleCalendar
  has_calendar
end
