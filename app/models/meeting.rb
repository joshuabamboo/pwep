class Meeting < ActiveRecord::Base
  belongs_to :user

  def self.find_author_by_id(id)
    User.find(id)
  end
end
