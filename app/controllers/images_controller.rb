class ImagesController < ApplicationController

    def index
        images = Image.all 
        render json: images 
    end 

    def show 
        image = Image.find(params[:id])
        render json: image
    end 

    def public
        images = Image.select{|image| image[:public] == true}

        public_images = []

        images.collect do |image| 
          public_image = {}
          public_image[:description] = image.description
          public_image[:imgUrl] = image.imgUrl
          public_images.push(public_image)
        end 

        render json: public_images
    end  

    def new 
        image = Image.new 
    end 

    def create
        imageUploaded = Cloudinary::Uploader.upload(params[:imgUrl])
        new_image_params = image_params
        new_image_params[:imgUrl] = imageUploaded["url"]
        image = Image.create(new_image_params)

        render json: image, except:[:updated_at, :created_at]
    end 

    def destroy 
        
        #Cloudinary::Uploader.destroy(params)
        image = Image.find_by(id: params[:id])
        
        img = image.imgUrl.split("/")
        cloudID = img[img.length - 1] 
        cloudIDFinal = cloudID.split(".")
        
        Cloudinary::Uploader.destroy(cloudIDFinal[0])
        
        image.destroy
        render json: image
    end 

    private 

    def image_params
        params.permit(:user_id, :imgUrl, :description, :public)
    end 

end
