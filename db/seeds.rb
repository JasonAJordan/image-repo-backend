# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


User.destroy_all
Image.destroy_all

imgSeed = "https://res.cloudinary.com/jasonjordan/image/upload/v1613589596/ajxzmzfqsamz7a2jj3fm.png"

jason = User.create(username: "JasonJordan", password:"1234")

img1 = Image.create(imgUrl: imgSeed, description: "This is a seeded image", user_id: jason.id)

