class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(item)
     stock_number = @stock[item]
     if stock_number == nil
       stock_number = 0
     end
     stock_number
  end
end
