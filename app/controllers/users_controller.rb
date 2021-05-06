class UsersController < ApplicationController

    # def index
    #     users = User.all 
    #     render json: users 
    # end 

    # def show 
    #     user = User.find(params[:id])
    #     render json: user, except:[:updated_at, :created_at]
    # end 

    def profile

        auth_headers = request.headers["Authorization"]
        token = auth_headers.split.last
        begin
            payload = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorthim: 'HS256' })
            user_id = payload[0]["user_id"]
            #find the user 
            user = User.find(user_id)
            render json: user
        rescue 
            render json: {error: "nice try"}, status: :unauthorized
        end 
    end 

    # Check app/services/authorize_request.rb, not reading the helper class. 
    # "status": 500,
    # "error": "Internal Server Error",
    # "exception": "#<NameError: uninitialized constant UsersController::AuthorizeRequest>",
    # def profile  
    #     user = AuthorizeRequest.new(request.headers).user
    #     if user 
    #         render json: user 
    #     else 
    #         render json: { error: "nice try, pal."}, status: :unauthorized
    #     end 
    # end 


end
