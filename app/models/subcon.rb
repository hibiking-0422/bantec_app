class Subcon < ApplicationRecord
    belongs_to :project

    def self.total
        subcons = Subcon.all
        sum = 0

        subcons.each do |subcon|
            sum += subcon.subcon_cost
        end
        return sum
    end
end
