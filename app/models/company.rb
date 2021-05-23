class Company < ApplicationRecord

  belongs_to :user

  enum status: %i[ active inactive ]

  validates :name, :year_attained, :value_unit, presence: true
end
