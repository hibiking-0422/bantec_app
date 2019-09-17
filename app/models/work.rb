class Work < ApplicationRecord
    belongs_to :project

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
end
