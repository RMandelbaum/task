class TaskDetail < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :responses
end
