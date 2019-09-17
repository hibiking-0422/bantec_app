class Part < ApplicationRecord
    belongs_to :project

    def self.total
        parts = Part.all
        sum = 0

        parts.each do |part|
            sum += part.unit_price * part.volume
        end
        return sum
    end
end
