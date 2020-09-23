class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, stock)
    @stock[ingredient] += stock
  end

  def enough_ingredients_for?(recipe1)
    ingredient_check = true
    recipe1.ingredients_required.each do |ingredient, amount_required|
      if @stock[ingredient] >= amount_required
        ingredient_check = true
      else
        return false
      end
    end
    ingredient_check
  end
end
