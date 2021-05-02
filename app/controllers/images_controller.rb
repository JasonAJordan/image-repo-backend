class ImagesController < ApplicationController

    def index
        images = Image.all 
        render json: images 
    end 

    def show 
        image = Image.find(params[:id])
        render json: image
    end 
    

    def new 
        image = Image.new 
    end 

    def create
        #image = Image.create(image_params)
        #puts params 

        imageUploaded = Cloudinary::Uploader.upload(params[:imgUrl])
        puts "testing"
        new_image_params = image_params
        new_image_params[:imgUrl] = imageUploaded["url"]
        image = Image.create(new_image_params)

        render json: image, except:[:updated_at, :created_at]
    end 

    private 

    def image_params
        params.permit(:user_id, :imgUrl, :description)
    end 

end
