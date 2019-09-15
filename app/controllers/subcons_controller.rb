class SubconsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @subcons = @project.subcon
  end

  def new
    @subcon = Subcon.new
  end

  def create
    subcon = Subcon.new(subcon_params)

    if subcon.save
      redirect_to subcons_path(project_id: params[:subcon][:project_id])
    else
      render 'new'
    end
  end
  

  def edit
    @subcon = Subcon.find(params[:id])
  end

  def update
    subcon = Subcon.find(params[:id])
    project_id = subcon.project_id
    subcon.update!(subcon_params)
    redirect_to subcons_path(project_id: project_id)
  end

  def delete
    subcon = Subcon.find(params[:id])
    project_id = subcon.project_id
    subcon.destroy
    redirect_to subcons_path(project_id: project_id)
  end

  private

  def subcon_params
    params.require(:subcon).permit(:subcon_name,:subcon_cost,:day,:project_id)
  end
end
