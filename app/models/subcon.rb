class Subcon < ApplicationRecord
    belongs_to :project

    def all_cost
        sum = 0
        @subcons.each do |subcon|
          sum += subcon.subcon_cost
        end
      return sum
    end
  
    def self.total
        subcons = Subcon.all
        sum = 0

        subcons.each do |subcon|

            sum += subcon.subcon_cost
        end
        return sum
    end

    def self.partial(start_date,end_date)
        sum = 0
        search_subcons = Subcon.where(day: start_date..end_date)

        search_subcons.each do |subcon|
            sum += subcon.subcon_cost
        end
        return sum
    end


    def set(project_id)
        @subcons = Subcon.where(project_id: project_id)
    end
end
