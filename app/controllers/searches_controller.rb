class SearchesController < ApplicationController
  def index
    @drivers_cost = Driver.total
    @works_cost = Work.total
    @subcons_cost = Subcon.total
    @parts_cost = Part.total

    @materials = @parts_cost * 0.08
    @management_costs = (@works_cost + @parts_cost) * 0.03

    @all_cost = @drivers_cost + @works_cost + @subcons_cost + @parts_cost + @materials + @management_costs

    @start_date = params[:start_date]
    @end_date = params[:end_date]

    @search_drivers = Driver.partial(@start_date,@end_date)
    @search_works = Work.partial(@start_date,@end_date)
    @search_subcons = Subcon.partial(@start_date,@end_date)
    @search_parts = Part.partial(@start_date,@end_date)



  end
end
