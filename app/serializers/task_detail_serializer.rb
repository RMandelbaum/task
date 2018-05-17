class TaskDetailSerializer < ActiveModel::Serializer
  attributes :id, :response, :due_date, :category_id, :user_id

  belongs_to :category
  belongs_to :user
  

end
