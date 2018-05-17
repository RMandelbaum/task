class CategorySerializer < ActiveModel::Serializer
  attributes :id, :task_type

  has_many :task_details
end
