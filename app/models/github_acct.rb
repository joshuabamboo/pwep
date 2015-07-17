class GithubAcct < ActiveRecord::Base

  def get_commits(username, repository)
    github_client.repos.commits.all  username, repository
  end

  private
  def github_client
    Github.new :oauth_token => ''
  end
end
