class Store
  DISCOUNT = 0.25

  def self.sale(item, discount) 
    if discount
      puts "You are getting a discount of #{DISCOUNT*100}%"
      item.price - (item.price * DISCOUNT)
    else
      item.price
    end
  end
end
