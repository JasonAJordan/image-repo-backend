class ImageSerializer < ActiveModel::Serializer
  attributes :description, :imgUrl, :public, :user_id, :id
  
end
