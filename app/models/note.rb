class Note < ActiveRecord::Base
  belongs_to :user
  # for now I will do this as a method, but I would like to figure out the association for the admin as author
  # belongs_to :admin, :class_name => :User, :foreign_key => "author"
  # belongs_to :student, :class_name => :User, :foreign_key => "user_id"
end
