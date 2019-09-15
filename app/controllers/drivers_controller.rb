class DriversController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @drivers = @project.driver
  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.new(driver_params)

    if driver.save
      redirect_to drivers_path(project_id: params[:driver][:project_id])
    else
      render 'new'
    end
  end

  def show

  end

  def edit
  end

  private

  def driver_params
    params.require(:driver).permit(:driver_cost,:project_id)  
  end
end
