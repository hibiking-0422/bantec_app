class Project < ApplicationRecord
    belongs_to :user
    has_many :driver
    has_many :work
end
