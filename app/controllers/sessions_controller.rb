class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def new
  end

  def create
    require 'faraday'    
    response = Faraday.post "https://github.com/login/oauth/access_token", 
      {client_id: ENV["GITHUB_CLIENT"], client_secret: ENV["GITHUB_SECRET"], 
        code: params[:code]}, 
      {'Accept' => 'application/json'}
    # user = User.find_by_email(params[:email])
    # # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
    #   # Save the user id inside the browser cookie. This is how we keep the user 
    #   # logged in when they navigate around our website.
    #   session[:user_id] = user.id
    #   redirect_to root_path
    # else
    # # If user's login doesn't work, send them back to the login form.
    #   redirect_to '/login'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
