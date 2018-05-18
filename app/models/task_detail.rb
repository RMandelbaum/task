class TaskDetail < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :response, presence: true
  validates :due_date, presence: true

#Categories are hard coded because I entered in seed data @
#Would use sql to query for matching category_id with category.id

  #saves all the responses by category to a variable
  def self.get_task_details
    @tasks = TaskDetail.all
    @shopping = @tasks.where(category_id: 1)
    @donation = @tasks.where(category_id: 2)
    @moving_help = @tasks.where(category_id: 3)
    @house_cleaning = @tasks.where(category_id: 4)
    @other = @tasks.where(category_id: 5)
  end

  # Breaks down shopping responses into a hash
  # Not ideal, as would have to add new arrays with questions, but easier to do this than in the db.

  def self.get_shopping_responses
    @shopping_hash = {}
    store_names = []
    item_lists = []
    expected_price = []
    @shopping.each do |shop|
      response = shop.response
      store_names << response[0]
      item_lists << response[1]
      expected_price << response[2].to_i
    end
    @shopping_hash["store_name"] = store_names
    @shopping_hash["item_lists"] = item_lists
    @shopping_hash["expected_price"] = expected_price
    @shopping_hash
  end

  #Breaks down donation responses into a hash
  def self.get_donation_responses
    @donation_hash = {}
    vehicle_size = []
    address = []
    receipt = []
    @donation.each do |donate|
      response = donate.response
      vehicle_size << response[0]
      address << response[1]
      r = response[2].to_s == 'true' ? true : false
      receipt << r
    end
    @donation_hash["vehicle_size"] = vehicle_size
    @donation_hash["address"] = address
    @donation_hash["receipt"] = receipt
    @donation_hash
  end

  #Breaks down moving responses into a hash
  def self.get_moving_responses
    @moving_hash = {}
    num_people = []
    address = []
    @moving_help.each do |move|
      response = move.response
      num_people << response[0].to_i
      address << response[1]
    end
    @moving_hash["num_people"] = num_people
    @moving_hash["address"] = address
    @moving_hash
  end

  #Breaks down cleaning responses into a hash
  def self.get_house_cleaning_responses
    @cleaning_hash = {}
    address = []
    num_bathroom = []
    type = []
    @house_cleaning.each do |clean|
      response = clean.response
      address << response[0]
      num_bathroom << response[1].to_i
      type << response[2]
    end
    @cleaning_hash["address"] = address
    @cleaning_hash["num_bathroom"] = num_bathroom
    @cleaning_hash["type"] = type
    @cleaning_hash
  end

  #Breaks down other responses into a hash
  def self.get_other
    @other_hash = {}
    title = []
    description = []
    @other.each do |o|
      response = o.response
      title << response[0]
      description << response[1]
    end
    @other_hash["title"] = title
    @other_hash["description"] = description
    @other_hash
  end

  #Breaks down due_date responses into a hash
  def self.get_due_date
    @due_dates_hash = {}
    due_dates = []
    @tasks.each do |d|
      due_dates << d.due_date
      end
    @due_dates_hash["due_dates"] = due_dates
    @due_dates_hash
  end

#Methods to calculate statistic based on previous methods

  def self.calculate_highest_expense_for_shopping
    shopping = TaskDetail.get_shopping_responses
    prices = shopping["expected_price"]
    prices.sort
    prices.last
  end

  def self.calculate_most_used_vehicle
    vehicle = TaskDetail.get_donation_responses
    vehicle["vehicle_size"].group_by{|a| a }.sort_by{|a,b| b.size<=>a.size}.first[0]
  end

  def self.calculate_most_bathroom_cleaned
    bathroom = TaskDetail.get_house_cleaning_responses
    bathroom["num_bathroom"].group_by{|a| a }.sort_by{|a,b| b.size<=>a.size}.first[0]
  end

end
