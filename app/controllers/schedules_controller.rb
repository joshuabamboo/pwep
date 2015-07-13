class SchedulesController < ApplicationController
  def new
  end

  def create
  end

  def show
    @projects = Project.all
  end
end
