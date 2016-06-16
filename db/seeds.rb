brandon = User.create(email: "brandon@me.com", username: "brandon", password: "boats")
Trade.create(direction: "sell", size: 100, product: "TYZ6", trade_date: "jun 14 2016", user_id: 1, price: 132.25)
Trade.create(direction: "buy", size: 100, product: "EDZ7", trade_date: "jun 14 2016", user_id: 1, price: 99.00)
