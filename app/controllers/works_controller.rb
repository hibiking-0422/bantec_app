class WorksController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @works = @project.work
  end

  def new
    @work = Work.new
  end

  def create
    work = Work.new(work_params)

    if work.save
      redirect_to works_path(project_id: params[:work][:project_id])
    else
      render 'new'
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    project_id = work.project_id
    work.update!(work_params)
    redirect_to works_path(project_id: project_id)
  end

  def delete
    work = Work.find(params[:id])
    project_id = work.project_id
    work.destroy
    redirect_to works_path(project_id: project_id)
  end

  private

  def work_params
    params.require(:work).permit(:worker,:working_hour,:day,:wage,:project_id)
  end
end
