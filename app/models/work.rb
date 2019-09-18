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
            hour = 0
            arry2 = []
            @works.each do |work|
                if(worker == work.worker) then
                    hour += work.working_hour
                end
            end
            arry1.push(arry2.push(worker,hour))
        end
        return arry1
    end
    
    def self.total
        works = Work.all
        sum = 0

        if works.present? then
           works.each do |work|
               project = Project.find(work.project_id)
               sum += work.working_hour * project.wage
           end
        end
        return sum
    end

    def self.partial(start_date,end_date)
        sum = 0
        search_works = Work.where(day: start_date..end_date)

        search_works.each do |work|
            project = Project.find(work.project_id)
            sum += work.working_hour *  project.wage
        end
        return sum
    end
end
