require "minitest/autorun"
require "minitest/pride"
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class PantryTest < Minitest::Test
	def test_it_exist
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
	end

  def test_it_has_variables
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_stock_check
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})

    assert_equal 0, pantry.stock_check(ingredient1)
  end

  def test_restock
    pantry = Pantry.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})

    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)

    pantry.restock(ingredient2, 7)
    assert_equal 7, pantry.stock_check(ingredient2)
  end

	def test_enough_ingredients
		pantry = Pantry.new
		ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
		ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})

		recipe1 = Recipe.new("Mac and Cheese")
		recipe1.add_ingredient(ingredient1, 2)
		recipe1.add_ingredient(ingredient2, 8)

		ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
		ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

		recipe2 = Recipe.new("Cheese Burger")
		recipe2.add_ingredient(ingredient1, 2)
		recipe2.add_ingredient(ingredient3, 4)
		recipe2.add_ingredient(ingredient4, 1)

		pantry.restock(ingredient1, 5)
		pantry.restock(ingredient1, 10)

		assert_equal false, pantry.enough_ingredients_for?(recipe1)

		pantry.restock(ingredient2, 7)
		assert_equal false, pantry.enough_ingredients_for?(recipe1)

		pantry.restock(ingredient2, 1)
		assert_equal true, pantry.enough_ingredients_for?(recipe1)
	end
end
