Product.destroy_all
User.destroy_all


#Create users
user1 = User.create!(
  email: "john@gmail.com",
    password: '123456'
  )

user2 = User.create!(
    email: "peter@gmail.com",
      password: "123456"
    )
user3 = User.create!(
      email: "matthijs@gmail.com",
        password: "123456"
      )

user4 = User.create!(
        email: "david@gmail.com",
          password: "123456"
        )

#Create products
product1 = Product.create!(name: "T-shirt", description: "All sizes are available")
product2 = Product.create!(name: "Closet", description: "Latest model")
product3 = Product.create!(name: "Table", description: "Oval table")
product4 = Product.create!(name: "Chair", description: "Red fancy chair")
