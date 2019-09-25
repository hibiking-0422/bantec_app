class HitsController < ApplicationController
  def index

  end

  def show
    if params[:project_name].present?
      @projects = Project.where(user_id: current_user.id).where(project_name: params[:project_name]).order(day: "DESC")
    elsif params[:construction_number].present?
      @projects = Project.where(user_id: current_user.id).where(construction_number: params[:construction_number].to_i).order(day: "DESC")
    else
      @error ="見つかりませんでした..."
    end
  end
end
