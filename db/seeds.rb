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
product1 = Product.create!(name: "T-shirt", description: "All sizes are available", price: 20.0, warehouseQuantity: 20)
product2 = Product.create!(name: "Closet", description: "Latest model", price: 400.0, warehouseQuantity: 10)
product3 = Product.create!(name: "Table", description: "Oval table", price: 200.0, warehouseQuantity: 15)
product4 = Product.create!(name: "Chair", description: "Red fancy chair", price: 15.0, warehouseQuantity: 100)
