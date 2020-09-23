require "minitest/autorun"
require "minitest/pride"
require './lib/pantry'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'


class CookBookTest < Minitest::Test
	def test_it_exist
    cookbook = CookBook.new

    assert_instance_of CookBook, cookbook
	end

  def test_it_has_readable_variables
    cookbook = CookBook.new

    assert_equal [], cookbook.recipes
  end
end
