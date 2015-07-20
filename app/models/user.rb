class User < ActiveRecord::Base
  has_many :projects
  has_many :meetings
  has_many :notes
  has_secure_password


  def self.find_or_create_from_auth_hash(auth)
    binding.pry
    user = User.find_or_create_by(id: auth["id"])
    # self.where(id: auth["id"]).first_or_initialize.tap do |user|
    #   user.access_token = auth.credentials.token
    #   user.github_username = auth.info.nickname
    #   user.provider = auth.provider
    #   user.uid = auth.uid
    #   user.email = auth.info.email
    #   user.image = auth.info.image
    #   user.admin = user.is_admin?
    #   user.save
    # end
  end
end