class ProjectsController < ApplicationController
  def index
    if params[:next_date].present?
      @date = Time.parse(params[:next_date]).since(3.month)
    elsif params[:prev_date].present?
      @date = Time.parse(params[:prev_date]).ago(3.month)
    else
      @date = Time.now
    end

    @projects = Project.rangeMonth(@date,current_user.id)

    @prev_date = @date.prev_month
    @prev_projects = Project.rangeMonth(@prev_date,current_user.id)

    @reprev_date = @prev_date.prev_month
    @reprev_projects = Project.rangeMonth(@reprev_date,current_user.id)
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    project.user_id = current_user.id
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
    works.set(params[:id])
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

    @project_all_cost = @driver_cost + @work_cost + @subcons_cost + @parts_cost + @material + @management_cost

    if @project.contract.nil? then
      @project.contract = 0
    end

    if @project.cont_budget.nil? then
      @project.cont_budget = 0
    end

    @forecast_cost = @project.contract - @project.cont_budget
    @real_cost = @project.contract - @project_all_cost

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
    params.require(:project).permit(:project_name,:customer_name,:delivery_destination,:construction_number,:user_id,:day,:contract, :cont_budget)
  end
end
