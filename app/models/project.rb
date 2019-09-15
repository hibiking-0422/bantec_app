class Project < ApplicationRecord
    belongs_to :user
    has_many :driver
    has_many :work
    has_many :subcon
    has_many :part
end
