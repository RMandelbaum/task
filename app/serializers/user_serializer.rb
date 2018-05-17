class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest

  has_many :task_details

end
