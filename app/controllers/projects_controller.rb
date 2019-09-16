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

    drivers =  Driver.new
    drivers.set(params[:id])
    @driver_cost = drivers.all_cost

    works = Work.new
    works.set(params[:id],@project.wage)
    @work_hour = works.all_hour
    @piece_workers = works.piece_workers
    @work_cost = works.all_cost

    subcons = Subcon.new
    subcons.set(params[:id])
    @subcons_cost = subcons.all_cost

    parts = Part.new
    parts.set(params[:id])
    @parts_cost = parts.all_cost
    
    @material = @parts_cost * 0.08
    @management_cost = (@work_cost + @parts_cost) * 0.03
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
