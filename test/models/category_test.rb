require "test_helper"

class CategoryTest < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "shirts")
	end

	test "Category should be valid" do
		assert @category.valid?
	end

	test "Category name should not be blank" do
		@category.name = " "
		assert_not @category.valid?
	end

	test "Category name should be unique" do
		@category.save
		@category = Category.new(name: "shirts")
		assert_not @category.valid?
	end

	test "Category name should not be long" do
		@category.name = 'a' * 26
		assert_not @category.valid?
	end

	test "Category name should not be short" do
		@category.name = 'aa'
		assert_not @category.valid?
	end
end