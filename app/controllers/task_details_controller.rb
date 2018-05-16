class TaskDetailsController < ApplicationController

  def new
    @task = TaskDetail.new

  end

  def create
    @task = TaskDetail.new(response: params[:task_detail][:response], due_date: params[:task_detail][:due_date], category_id: params[:category_id], user_id: session[:user_id])
    if @task.save
      @category = Category.find(params[:category_id])
      redirect_to category_task_index_path
    end
  end

  def index
    @tasks = TaskDetail.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])

  end

  def show

    @task = TaskDetail.find(params[:id])
  end
end
