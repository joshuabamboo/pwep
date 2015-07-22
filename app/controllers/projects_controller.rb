class ProjectsController < ApplicationController
  before_filter :authorize

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to projects_path
    else
      render "new"
    end
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    github_acct = GithubAcct.new(current_user.token)
    @commits = github_acct.get_commits('joshuabamboo', 'tic-tac-toe-cli')
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      # Handle a successful update.
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end


private

  def project_params
    params.require(:project).permit(:title, :project_type, :description, :starts_at, :user_id, :link, :complete)
  end
end

