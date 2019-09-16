class ProjectsController < ApplicationController
  def index
    @projects = Project.where(user_id: current_user.id)
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    project.user_id = current_user.id
    project.wage = set_default_wage
    if project.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])

    @driver_cost = Driver.sums(params[:id])
  end
  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    redirect_to action: 'show'
  end

  def delete
    project = Project.find(params[:id])
    project.destroy
    redirect_to action: 'index'
  end

  private
  
  def project_params
    params.require(:project).permit(:project_name,:customer_name,:delivery_destination,:construction_number,:wage,:user_id,:day)
  end

  def set_default_wage
    return 2500
  end
end
