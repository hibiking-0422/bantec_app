class PartsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @parts = @project.part.order(day: "DESC")

    if params[:count].present?
      @count = params[:count]
    end
  end

  def new
  end

  def create
    count = 0
    10.times do |i|
      i *= 6
    if params[:parts][i].present? && params[:parts][i+1].present? && params[:parts][i+2].present? && params[:parts][i+3].present? && params[:parts][i+4].present? && params[:parts][i+5].present?
      part = Part.new(
        part_name: params[:parts][i],
        maker: params[:parts][i+1],
        vender: params[:parts][i+2],
        unit_price: params[:parts][i+3],
       volume: params[:parts][i+4],
       day: params[:parts][i+5],
       project_id: params[:project_id]
      )
      part.save!
      count += 1
     end
    end
    redirect_to parts_path(project_id: params[:project_id],count: count)
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
