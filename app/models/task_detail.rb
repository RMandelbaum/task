class TaskDetail < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :responses

  validates :responses, presence: true
end
