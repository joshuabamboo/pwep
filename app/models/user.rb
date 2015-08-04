class User < ActiveRecord::Base
  has_many :projects
  has_many :meetings
  has_many :notes
  validates_presence_of :name, :username, :id


  def self.find_or_create_from_auth_hash(auth)
    self.where(id: auth["id"]).first_or_initialize.tap do |user|
      user.name = auth["name"]
      user.username = auth["login"]
      user.email = auth["email"]
      user.image = auth["avatar_url"]
      user.token = auth["token"]
      user.admin = user.is_admin?
      user.save
    end
  end

  def is_admin?
    client.organization_member?('learn-co-curriculum', self.username)
  end

  private
  def client
    Octokit::Client.new(access_token: self.token, client_id: ENV['GITHUB_CLIENT'], client_secret: ENV['GITHUB_SECRET'])
  end
end