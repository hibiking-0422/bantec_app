class Work < ApplicationRecord
    belongs_to :project

    def all_hour
        sum = 0
        @works.each do |work|
            sum += work.working_hour
        end
        return sum
    end

    def set(project_id)
        @works = Work.where(project_id: project_id)
    end

    def all_cost
        cost = 0
            @works.each do |work|
                cost += work.working_hour * work.wage
            end
        return cost
    end

    def piece_workers
        arry1 = []
  
        workers = ["前島","内田","山口"]
        workers.each do |worker|
            cost = 0
            arry2 = []
            @works.each do |work|
                if(worker == work.worker) then
                    cost += work.working_hour * work.wage
                end
            end
            arry1.push(arry2.push(worker,cost))
        end
        return arry1
    end
    
    def self.total
        works = Work.all
        sum = 0

        if works.present? then
           works.each do |work|
               sum += work.working_hour * work.wage
           end
        end
        return sum
    end

    def self.partial(start_date,end_date)
        sum = 0
        search_works = Work.where(day: start_date..end_date)

        search_works.each do |work|
            sum += work.working_hour *  work.wage
        end
        return sum
    end
end
