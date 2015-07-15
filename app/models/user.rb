class User < ActiveRecord::Base
  has_many :projects
  has_many :meetings
  has_many :notes
  has_secure_password
end