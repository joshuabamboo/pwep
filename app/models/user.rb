class User < ActiveRecord::Base
  has_many :projects
  has_many :meetings
  has_many :notes
  has_secure_password


  def self.find_or_create_from_auth_hash(auth)
    binding.pry
    self.where(id: auth["id"]).first_or_initialize.tap do |user|
      user.name = auth["name"]
      user.username = auth["login"]
      user.email = auth["email"]
      user.image = auth["avatar_url"]
      user.admin = user.is_admin?
      user.save
    end
  end

  def is_admin?
    #find out if they are a member of flatiron curriculum
    if self.email == "joshuaowens011@gmail.com"
      true
    else
      false
    end
  end
end