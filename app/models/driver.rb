class Driver < ApplicationRecord
    belongs_to :project

    def self.sums(project_id)
        drivers = Driver.where(project_id: project_id)

        drivers.each do |driver|
            sum += driver.driver_cost
        end

        return sum
    end
end
