class ProjectsController < ApplicationController
  def index
    @projects = Project.where(user_id: current_user.id)
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  private
  def project_params
    params.require(:project).permit(:project_name,:customer_name,:delivery_destination,:construction_number,:user_id)
  end
end
