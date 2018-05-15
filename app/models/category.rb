class Category < ApplicationRecord
  validates :task_type, presence:true, uniqueness:true 
end
