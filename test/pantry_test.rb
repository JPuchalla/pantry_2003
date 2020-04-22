require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @recipe = Recipe.new("Mac and Cheese")
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_for_attributes
    assert_equal ({}), @pantry.stock
    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_restock_item
     @pantry.restock(@ingredient1, 5)
     @pantry.restock(@ingredient1, 10)
     assert_equal 15, @pantry.stock_check(@ingredient1)
     @pantry.restock(@ingredient2, 7)
     @pantry.stock_check(@ingredient2)
  end

  def test_if_it_can_restock_and_check_if_enough_ingredients_are_present
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    assert_equal false, @pantry.enough_ingredients_for?(@recipe)
    @pantry.restock(@ingredient2, 7)
    assert_equal false, @pantry.enough_ingredients_for?(@recipe)
    @pantry.restock(@ingredient2, 1)
    assert_equal true, @pantry.enough_ingredients_for?(@recipe)
  end
end
