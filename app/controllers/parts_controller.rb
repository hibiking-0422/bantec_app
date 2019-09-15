class PartsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @parts = @project.part
  end

  def new
    @part = Part.new
  end

  def create
    part = Part.new(part_params)

    if part.save
      redirect_to parts_path(project_id: params[:part][:project_id])
    else
      render 'new'
    end
  end

  def edit
    @part = Part.find(params[:id])
  end

  def update
    part = Part.find(params[:id])
    project_id = part.project_id
    part.update!(part_params)
    redirect_to parts_path(project_id: project_id)
  end

  def delete
    part = Part.find(params[:id])
    project_id = part.project_id
    part.destroy
    redirect_to parts_path(project_id: project_id)
  end

  private

  def part_params
    params.require(:part).permit(:part_name,:unit_price,:volume,:maker,:vender,:day,:project_id)
  end
end
