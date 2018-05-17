class TaskDetail < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :responses
  accepts_nested_attributes_for :responses
  #validates :responses, presence: true

#Categories are hard coded because I entered in seed data @
#Would use sql to query for matching category_id with category.id

  def self.get_task_details
    @tasks = TaskDetail.all
    @shopping = @tasks.where(category_id: 1)
    @donation = @tasks.where(category_id: 2)
    @moving_help = @tasks.where(category_id: 3)
    @house_cleaning = @tasks.where(category_id: 4)
    @other = @tasks.where(category_id: 5)
  end

  def self.get_shopping_responses
    @shopping_hash = {}
    store_names = []
    item_lists = []
    expected_price = []
    @shopping.each do |shop|
      response = eval(shop.response)
      store_names << response[0]
      item_lists << response[1]
      expected_price << response[2].to_i
    end
    @shopping_hash["store_name"] = store_names
    @shopping_hash["item_lists"] = item_lists
    @shopping_hash["expected_price"] = expected_price
    @shopping_hash
  end

  def self.get_donation_responses
    vehicle_size = []
    address = []
    receipt = []
    @donation.each do |donate|
      response = eval(donate.response)
      vehicle_size << response[0]
      address << response[1]
      receipt << response[2]
    end
    vehicle_size
    address
    receipt
  end

  def self.get_moving_responses
    num_people = []
    address = []
    @moving_help.each do |move|
      response = eval(move.response)
      num_people << response[0].to_i
      address << response[1]
    end
    num_people
    address
  end

  def self.get_house_cleaning_responses
    address = []
    num_bathroom = []
    type = []
    @house_cleaning.each do |clean|

      response = clean.response
      address << response[0]
      num_bathroom << response[1].to_i
      type << response[2]
    end
    address
    num_bathroom
    type
  end

  def self.get_other
    title = []
    description = []
    @other.each do |o|
      response = eval(o.response)
      title << response[0]
      description << response[1]
    end

    title
    description
  end


  def self.get_due_date
    due_dates = []
    @tasks.each do |d|
      due_dates << d.due_date
      end
    due_dates
  end

  def self.calculate_highest_expense_for_shopping
    shopping = TaskDetail.get_shopping_responses
    prices = shopping["expected_price"]
    prices.sort
    prices[0]
  end
end
