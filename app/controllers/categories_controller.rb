class CategoriesController < ApplicationController
  before_action :check_for_mobile, :only => [:new, :edit]

  # Always render mobile versions for these, regardless of User-Agent.
  before_action :prepare_for_mobile, :only => :show
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render "categories/new"
    end
  end

  def show
    @category = Category.find(params[:id])
    @tasks = TaskDetail.where(category_id: @category.id)
    @task = TaskDetail.new

    @vehicle = [['Car', "car"], ['Bike', "bike"], ['Truck', "truck"]]


    # if @task.save
    #   redirect_to root_path
    # end
    render "categories/show"
  end

  private

  def category_params
    params.require(:category).permit(:task_type, :task_details_attributes => [:name, :response, :due_date, :category_id, :user_id])
  end


end
