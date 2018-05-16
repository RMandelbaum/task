class CategoriesController < ApplicationController

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
    # if @task.save
    #   redirect_to root_path
    # end
    render "categories/show"
  end

  private

  def category_params
    byebug
    params.require(:category).permit(:task_type, :task_details_attributes => [:name, :question, :response, :due_date, :category_id])
  end


end
