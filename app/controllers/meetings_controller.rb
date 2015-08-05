class MeetingsController < ApplicationController
  def index
    @student = User.find(params[:user_id])
    @meetings = Meeting.all
    @note = Note.new
    @notes = Note.where("user_id=? AND author=?", params[:user_id], current_user.id) 
    @project = Project.new    
  end

  def show
  end

  def create
  end

  def new
  end
end
