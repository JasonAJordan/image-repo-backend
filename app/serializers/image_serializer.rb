class ImageSerializer < ActiveModel::Serializer
  attributes :id, :imgUrl, :description, :user_id
  
end
