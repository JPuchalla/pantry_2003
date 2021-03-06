class Recipe
  attr_reader :name, :ingredients_required
  def initialize(list)
    @name = list
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
    @ingredients << ingredient
  end

  def ingredients
    @ingredients.uniq
  end

  def total_calories
    @ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end


end
