class Work < ApplicationRecord
    belongs_to :project

    def all_hour
        @sum = 0
        @works.each do |work|
            @sum += work.working_hour
        end
        return @sum
    end

    def set(project_id,wage)
        @works = Work.where(project_id: project_id)
        @wage = wage
    end

    def all_cost
        return @sum * @wage
    end

    def piece_workers
        arry1 = []
  
        workers = ["前島","内田","山口"]
        workers.each do |worker|
            cost = 0
            arry2 = []
            @works.each do |work|
                if(worker == work.worker) then
                    cost += work.working_hour * @wage
                end
            end
            arry1.push(arry2.push(worker,cost))
        end
        return arry1
    end
end
