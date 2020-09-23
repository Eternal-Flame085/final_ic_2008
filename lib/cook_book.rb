class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredient_list = []
    @recipes.each do |recipe|
      ingredient_list << recipe.ingredients.map do |ingredient|
        ingredient.name
      end
    end
    ingredient_list.flatten!.uniq
  end
end
