class GithubAcct < ActiveRecord::Base

  def get_commits(username, repository)
    github_client.repos.commits.all  username, repository
  end

  private
  def github_client
    Github.new :oauth_token => ''
  end

  def client(token)
    Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
  end
end
