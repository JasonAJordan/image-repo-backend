class ImagesController < ApplicationController

    # def index
    #     images = Image.all 
    #     render json: images 
    # end 

    # def show 
    #     image = Image.find(params[:id])
    #     render json: image
    # end 

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
        auth_headers = request.headers["Authorization"]
        token = auth_headers.split.last

        payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorthim: 'HS256' })
        user_id = payload[0]["user_id"]
        #verifies  the user 
        if (image_params[:user_id] == user_id.to_s)
            imageUploaded = Cloudinary::Uploader.upload(params[:imgUrl])
            new_image_params = image_params
            new_image_params[:imgUrl] = imageUploaded["url"]
            image = Image.create(new_image_params)
    
            render json: image, except:[:updated_at, :created_at]
        else 
            render json: {error: "nice try"}, status: :unauthorized
        end
        
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

    def createdev
        imageUploaded = Cloudinary::Uploader.upload(params[:imgUrl])
        new_image_params = image_params
        new_image_params[:imgUrl] = imageUploaded["url"]
        image = Image.create(new_image_params)

        render json: image, except:[:updated_at, :created_at]
    end 
    private 

    def image_params
        params.permit(:user_id, :imgUrl, :description, :public)
    end 

end
