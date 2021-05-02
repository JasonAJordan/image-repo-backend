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
        image = Image.create(image_params)

        render json: image, except:[:updated_at, :created_at]
    end 

    private 

    def image_params
        params.permit(:user_id, :imgUrl, :description)
    end 

end
