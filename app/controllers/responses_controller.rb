class ResponsesController < ApplicationController
  belongs_to :questions

  def index
    @responses = Response.all
    @responses.get_response
end
