class Person
  attr_accessor :first_name, :age
  attr_writer :student

  def initialize
   @age = 18
   @items = []
   @total = 0
  end
  
  def discount?
    if age > 65 || student?
      true
    else
      false
    end
  end

  def total
    calculate_total
    @total
  end

  def add_to_cart item
    @items << item 
  end

  def student?
    @student
  end

  private

  def calculate_total
    @items.each do |item|
      @total += Store.sale(item, self.discount?) 
    end
  end
end
