class AuthController < ApplicationController

  def register
    #create a new user 
    
    register_params = params.permit(:username, :password)
    
    user = User.create(register_params)
    
    if user.valid?
      #if user is authenticated, sends back the user object and a JWT
      secret = Rails.application.secrets.secret_key_base
      token = JWT.encode({ user_id: user.id}, secret, "HS256")

      render json: {user: UserSerializer.new(user), token: token}
    else 
      render json: { error: "Use a diffrent username"}, status: :unprocessable_entity
    end
  end

  def login
    #finds the user
    user = User.find_by(username: params[:username])
    #authenticates password
    if user && user.authenticate(params[:password])
      #if user is authenticated, sends back the user object and a JWT
      secret = Rails.application.secrets.secret_key_base
      token = JWT.encode({ user_id: user.id}, secret, "HS256")

      render json: {user: UserSerializer.new(user), token: token}

     
    else 
      render json: {error: "Invalid username or password"}, status: :unauthorized
    end 
  end 



end
