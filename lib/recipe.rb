class Recipe
  attr_reader :name, :ingredients_required, :ingredients
  def initialize(list)
    @name = list
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
    @ingredients << ingredient
  end

  def total_calories
    @ingredients_required.map do |ingredient|
      ingredient.calories * ingredient[:calories].length
    end

  end

end
