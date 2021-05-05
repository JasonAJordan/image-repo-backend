
This is the backend for my Shopify's Fall 2021 Backend Developer Internship code challege. 

This app is modeled with Ruby on Rails backend, Reactjs frontend, PostgreSQL as the database, and Cloudinary as the image API. Users can upload images either privatly or publicly and can delete them as well. The app features user authentication with the help of ruby gems bycrpt and jwt. 






##  Setup. 

1. You must created your own cloudinary.rb file with your cloudinary acount api information. This file is listed in gitignore and will not transfer over if you clone done the repo. 

```rb
#config/initializers/cloudinary.rb
Cloudinary.config do |config|    
    config.cloud_name = ""   
    config.api_key = ""   
    config.api_secret = ""   
    config.secure = true    
    config.cdn_subdomain = true  
end
```



1. Bundle install 
2. rails db:create db:migrate db:seed
3. rails start



4. Run "npm start" in your console where the frontend is located. 

## JWT Authentication in a nutshell. 

Our new authentication flow for APIs won't involve sending cookies, but we'll
still need some special token to authenticate our users.

For that token we'll be using JWT.

![jwt auth flow](https://miro.medium.com/max/960/1*l-FS80RhxUgjZOKGgOXnTQ.jpeg)

Here is the JWT authentication flow for logging in:

1. An already existing user requests access with their username and password
2. The app validates these credentials
3. The app gives a signed token to the client
4. The client stores the token and presents it with every request. This token is effectively the user's access pass––it proves to our server that they are who they claim to be.

