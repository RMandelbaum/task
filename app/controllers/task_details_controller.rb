class TaskDetailsController < ApplicationController

  def new
    @task = TaskDetail.new

  end

  def create

    @task = TaskDetail.new(response: params[:task_detail][:response], due_date: params[:task_detail][:due_date], category_id: params[:category_id], user_id: session[:user_id])
    #eval(params[:task_detail[:response]])
    if @task.save
      @category = Category.find(params[:category_id])
      redirect_to root_path
  else
    @category = Category.find(params[:category_id])

    redirect_to category_path(@category.id)
  end
end

  def index
    @tasks = TaskDetail.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])

  end

  def show

    @task = TaskDetail.find(params[:id])

      #serialized api json 
      #render json: @task
  end

  def task_stats

    TaskDetail.get_task_details
    @shopping = TaskDetail.calculate_highest_expense_for_shopping
    @donation = TaskDetail.get_donation_responses
    @moving = TaskDetail.get_moving_responses
    @cleaning = TaskDetail.get_house_cleaning_responses
    @other = TaskDetail.get_other
    @due_date = TaskDetail.get_due_date


  end
end
