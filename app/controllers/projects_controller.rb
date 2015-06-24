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


private

  def project_params
    params.require(:project).permit(:title, :description, :total_days)
  end
end

