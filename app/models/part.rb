class Part < ApplicationRecord
    belongs_to :project

    def all_cost
        sum = 0
        @parts.each do |part|
            sum += part.unit_price * part.volume 
        end
        return sum
    end

    def set(project_id)
        @parts = Part.where(project_id: project_id)
    end
end
