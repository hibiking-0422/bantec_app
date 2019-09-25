class Project < ApplicationRecord
    belongs_to :user
    has_many :driver, dependent: :destroy
    has_many :work, dependent: :destroy
    has_many :subcon, dependent: :destroy
    has_many :part, dependent: :destroy

    def self.rangeMonth(date, user_id)
        month_first = date.beginning_of_month
        month_end = date.end_of_month

        return Project.where(user_id: user_id).where(day: month_first..month_end).order(day: "DESC")
    end
end
