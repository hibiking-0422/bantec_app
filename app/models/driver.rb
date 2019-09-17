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
end
