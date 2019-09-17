class Project < ApplicationRecord
    belongs_to :user
    has_many :driver, dependent: :destroy
    has_many :work, dependent: :destroy
    has_many :subcon, dependent: :destroy
    has_many :part, dependent: :destroy
end
