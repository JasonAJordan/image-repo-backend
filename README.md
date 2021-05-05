
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

## Unit Test 

Tests to check HTTP request are located in the frontend [here](https://github.com/JasonAJordan/image-repo-frontend/blob/cleanup-%26-finalize/src/pages/UnitTests.js) *Note to self this link will change when I do a final merge.
These test can be also viewed when loading up the frontend of the app. 

## JWT Authentication in a nutshell. 

This app features the use of the gem jwt 
[Link to their site](https://jwt.io/)

Javascript Web Token will create a bearer token for each acount. Upon login the app validates the user's credentials. Then the app gives the token to the client. This token is needed with every request made by the the client as it proves to the server that they are who they claim to be. This token is also being used for the user's local storage cookies to keep them login after a page refersh. 

![jwt auth flow](https://miro.medium.com/max/960/1*l-FS80RhxUgjZOKGgOXnTQ.jpeg)



