class Subcon < ApplicationRecord
    belongs_to :project

    def all_cost
        sum = 0
        @subcons.each do |subcon|
            sum += subcon.subcon_cost
        end
        return sum
    end

    def set(project_id)
        @subcons = Subcon.where(project_id: project_id)
    end
end
