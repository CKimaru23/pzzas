restaurant1 = Restaurant.create(name: "Joe's Pizza")
restaurant2 = Restaurant.create(name: "Papa John's")
restaurant3 = Restaurant.create(name: "Pizza Hut")

pizza1 = Pizza.create(name: "Pepperoni")
pizza2 = Pizza.create(name: "Mushroom")
pizza3 = Pizza.create(name: "Supreme")

RestaurantPizza.create(restaurant: restaurant1, pizza: pizza1)
RestaurantPizza.create(restaurant: restaurant1, pizza: pizza2)
RestaurantPizza.create(restaurant: restaurant2, pizza: pizza2)
RestaurantPizza.create(restaurant: restaurant2, pizza: pizza3)
RestaurantPizza.create(restaurant: restaurant3, pizza: pizza1)
RestaurantPizza.create(restaurant: restaurant3, pizza: pizza3)

