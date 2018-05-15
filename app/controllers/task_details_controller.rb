class TaskDetailsController < ApplicationController

  def new
    @task = TaskDetail.new
    byebug
  end

  def create
    @category = Category.find(params[:id])
    @category.task = TaskDetail.where(category_id: @category.id)
    @task = TaskDetail.new(name:@category.task_type, question: params[:question], response: params[:response], due_date: params[:due_date], category_id:@category.id)
    byebug
    if @task.save
      redirect_to root_path
    end
    redirect_to root_path
  end
end
