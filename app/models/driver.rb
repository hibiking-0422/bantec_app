class Driver < ApplicationRecord
    belongs_to :project

    def self.total
        drivers = Driver.all
        sum = 0

        drivers.each do |driver|
            sum += driver.driver_cost
        end

        return sum
    end

    def all_cost
        sum = 0
        @drivers.each do |driver|
            sum += driver.driver_cost
        end

        return sum
    end

    def set(project_id)
        @drivers = Driver.where(project_id: project_id)
    end
end
