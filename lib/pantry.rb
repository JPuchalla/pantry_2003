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

  def restock(item, quantity)
    if @stock[item]
     @stock[item] += quantity
    else
     @stock[item] = quantity
    end
    @stock[item]
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? { |ingredient, required| @stock[ingredient] >= required }
  end

end
