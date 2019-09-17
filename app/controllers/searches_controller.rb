class SearchesController < ApplicationController
  def index
    @drivers_cost = Driver.total
    @works_cost = Work.total
    @subcons_cost = Subcon.total
    @parts_cost = Part.total
  end

  def show
  end

  
end
