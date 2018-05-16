class QuestionsController < ApplicationController
  belongs_to :task_detail
  has_many :responses
end
