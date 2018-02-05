require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
	def setup
		@category = Category.create(name: "sports")
		@user = User.create(user_name: "john", email: "john@example.com", password: "password", admin: true)
	end

	test "should get categories index" do
		get categories_path
		assert_response :success
	end

	test "get new category" do
		sign_in_as(@user, "password")
	   	get new_category_path
	   	assert_response :success
	end

	test "should get show" do
	   get category_path(@category)
	   assert_response :success
	end

	test "should not allow unlogged admin to create category" do
		assert_no_difference "Category.count" do
			post categories_path, params: {category: {name: "sports"}}
		end
		assert_redirected_to categories_path
	end

end
