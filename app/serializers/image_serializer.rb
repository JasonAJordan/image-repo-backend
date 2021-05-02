class ImageSerializer < ActiveModel::Serializer
  attributes :id, :description, :user_id, :imgUrl
  
end
