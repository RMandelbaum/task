 module TaskDetailsHelper
#   #Breaks down shopping responses into a hash
#   #Not ideal, as would have to add new arrays with questions, but easier to do this than in the db.
#   def self.get_shopping_responses
#     @shopping_hash = {}
#     store_names = []
#     item_lists = []
#     expected_price = []
#     @shopping.each do |shop|
#       response = eval(shop.response)
#       store_names << response[0]
#       item_lists << response[1]
#       expected_price << response[2].to_i
#     end
#     @shopping_hash["store_name"] = store_names
#     @shopping_hash["item_lists"] = item_lists
#     @shopping_hash["expected_price"] = expected_price
#     @shopping_hash
#   end
#   #Breaks down donation responses into a hash
#   def self.get_donation_responses
#     vehicle_size = []
#     address = []
#     receipt = []
#     @donation.each do |donate|
#       response = donate.response
#       vehicle_size << response[0]
#       address << response[1]
#       receipt << response[2]
#     end
#     vehicle_size
#     address
#     receipt
#   end
#
#   #Breaks down moving responses into a hash
#   def self.get_moving_responses
#     num_people = []
#     address = []
#     @moving_help.each do |move|
#       response = eval(move.response)
#       num_people << response[0].to_i
#       address << response[1]
#     end
#     num_people
#     address
#   end
#
#   #Breaks down cleaning responses into a hash
#   def self.get_house_cleaning_responses
#     address = []
#     num_bathroom = []
#     type = []
#     @house_cleaning.each do |clean|
#       response = clean.response
#       address << response[0]
#       num_bathroom << response[1].to_i
#       type << response[2]
#     end
#     address
#     num_bathroom
#     type
#   end
#
#   #Breaks down other responses into a hash
#   def self.get_other
#     title = []
#     description = []
#     @other.each do |o|
#       response = eval(o.response)
#       title << response[0]
#       description << response[1]
#     end
#     title
#     description
#   end
#
#   #Breaks down due_date responses into a hash
#   def self.get_due_date
#     due_dates = []
#     @tasks.each do |d|
#       due_dates << d.due_date
#       end
#     due_dates
#   end
#
#
#
end
