class Response < ApplicationRecord
  belongs_to :task_detail

  def self.get_response
    @responses = Response.all
    byebug
  end

end
