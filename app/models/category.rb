class Category < ApplicationRecord
  validates :task_type, presence:true, uniqueness:true
  has_many :task_details

  accepts_nested_attributes_for :task_details

end
