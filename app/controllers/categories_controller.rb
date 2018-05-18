class CategoriesController < ApplicationController
  before_action :check_for_mobile, :only => [:new, :edit]
  before_action :prepare_for_mobile, :only => :show
  before_action :require_login, only: [:new, :create, :show]


  #Main page, can view in JSON (for future API calls) or HTML
  def index
    @categories = Category.all
    respond_to do |format|
      format.json { render json: @categories }
      format.html { render "categories/index"}
    end
  end

  #Allows for future categories to be created
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

  #Category show page has nested form so the form can happen in one page, rather than two
  def show
    @category = Category.find(params[:id])
    @tasks = TaskDetail.where(category_id: @category.id)
    @task = TaskDetail.new
    @vehicle = ['Car', 'Bike', 'Truck']
    @cleaning_type = ['Light', 'Normal', 'Heavy']
    render "categories/show"

  end

  private

  def category_params
    params.require(:category).permit(:task_type, :task_details_attributes => [:response, :due_date, :category_id, :user_id])
  end


end
