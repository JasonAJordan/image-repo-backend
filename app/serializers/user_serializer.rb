class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name

  has_many :images

end
