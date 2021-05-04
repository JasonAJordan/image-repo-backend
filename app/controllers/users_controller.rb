class UsersController < ApplicationController

    def index
        users = User.all 
        render json: users 
    end 

    def show 
        user = User.find(params[:id])
        render json: user
    end 

    def new 
        user = User.new 
    end 

    def create
        user = User.create(user_params)
        render json: user, except:[:updated_at, :created_at]
    end 

    private 

    def user_params
        params.permit(:username, :password)
    end 

end
