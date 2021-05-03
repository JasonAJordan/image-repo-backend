class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password

  has_many :images
  
  # attributes :images

  # def images 
  #   custom_images = []

  #   object.images.collect do |image| 
  #     custom_image = {}
  #     custom_image[:id] = image.id
  #     custom_image[:description] = image.description
  #     custom_image[:imgUrl] = image.imgUrl
  #     custom_images.push(custom_image)
  #   end 
  #   return custom_images
  # end 



end
