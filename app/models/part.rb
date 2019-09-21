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
  
    def self.total
        parts = Part.all
        sum = 0

        parts.each do |part|
            sum += part.unit_price * part.volume
        end
        return sum
    end

    def self.partial(start_date,end_date)
        sum = 0
        search_parts = Part.where(day: start_date..end_date)

        search_parts.each do |part|
            sum += part.unit_price * part.volume
        end
        return sum
    end

    def self.search_vender(start_date,end_date,vender)
        if vender.present?    
            sum = 0
            search_parts = Part.where(day: start_date..end_date).where(vender: vender)

            search_parts.each do |part|
                sum += part.unit_price * part.volume
            end
                return sum
        else
            return nil
        end
    end
end
