class Item
  attr_reader :price
  def initialize(options)
    @price = options[:price] 
  end
end
