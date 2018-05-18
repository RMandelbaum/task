class TaskDetailsController < ApplicationController

  def home
    @tasks = TaskDetail.where(category_id: params[:category_id])
  end

  def new
    @task = TaskDetail.new
  end

  def create
    @category = Category.find(params[:category_id])
    @task = TaskDetail.new(response: params[:task_detail][:response], due_date: params[:task_detail][:due_date], category_id: params[:category_id], user_id: session[:user_id])

    if @task.save
      render "task_details/home"
  else
    redirect_to category_path(@category.id)
  end
end



  def show
    @task = TaskDetail.find(params[:id])
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
