class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :destroy]

  def new
    redirect_to "https://github.com/login/oauth/authorize?client_id=b511d53bdb7c15c29bd3&scope=repo"
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    if @user.save
      flash[:notice] = "Signed in"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "You must be part of the Flatiron School Github organization to use Flatiron Blogger!"
      redirect_to root_path
    end
  end

  def destroy
    session[:token] = nil
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def auth_hash
      response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: ENV["GITHUB_CLIENT"], client_secret: ENV["GITHUB_SECRET"], code: params[:code]}, {'Accept' => 'application/json'}
      body = JSON.parse(response.body)
      session[:token] = body["access_token"]

      user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
      JSON.parse(user_response.body)
    end
end
