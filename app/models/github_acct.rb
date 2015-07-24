class GithubAcct < ActiveRecord::Base
  attr_accessor :token

  def initialize(token)
    @token = token
  end
  
  def get_commits(username, repository)
    github_client.repos.commits.all(username, repository)
  end

  def get_commit(username, repository, sha)
    github_client.repos.commits.get(username, repository, sha)
  end

  private
  def github_client
    Github.new :oauth_token => token
  end

  # If not using the Github Gem
  # def client
  #   Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{token}", 'Accept' => 'application/json'}
  # end
end
