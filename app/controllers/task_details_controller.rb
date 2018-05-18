class TaskDetailsController < ApplicationController

  #Post submiting tasks, takes you to this page
  def home
    @tasks = TaskDetail.where(category_id: params[:category_id])
  end

 #create new task
  def new
    @task = TaskDetail.new
  end

  #creates and saves new task or redirects to submit form again
  def create
    @category = Category.find(params[:category_id])
    @task = TaskDetail.new(response: params[:task_detail][:response], due_date: params[:task_detail][:due_date], category_id: params[:category_id], user_id: session[:user_id])

    if @task.save
      render "task_details/home"
    else
     redirect_to category_path(@category.id)
    end
  end

 #json of all the tasks responses
  def index
    TaskDetail.get_task_details
    @shopping = TaskDetail.get_shopping_responses
    @donation = TaskDetail.get_donation_responses
    @moving = TaskDetail.get_moving_responses
    @cleaning = TaskDetail.get_house_cleaning_responses
    @other = TaskDetail.get_other
    @due_date = TaskDetail.get_due_date
    @all_data = {shopping: @shopping, donation: @donation, moving: @moving, cleaning: @cleaning, other: @other, due_date: @due_date}
    render json: @all_data 

  end

  #calls methods to show specific stats
  def task_stats
    TaskDetail.get_task_details
    @shopping = TaskDetail.calculate_highest_expense_for_shopping
    @donation = TaskDetail.calculate_most_used_vehicle
    @cleaning = TaskDetail.calculate_most_bathroom_cleaned
  end

end
