require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new" #getting the new categories path
    assert_response :success
    assert_difference 'Category.count', 1 do #after category is posted, count increases
      post categories_path, params: { category: { name: "Historical Fiction" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Historical Fiction", response.body
  end

  test "get new category form and reject invalid category submission" do
    get "/categories/new" #getting the new categories path
    assert_response :success
    assert_no_difference 'Category.count' do #after category is posted, count increases
      post categories_path, params: { category: { name: " " } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end
