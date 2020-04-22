class Recipe
  attr_reader :name, :ingredients_required
  def initialize(list)
    @name = list
    @ingredients_required = {}
  end
end
