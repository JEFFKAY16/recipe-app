require 'test_helper'

class RecipeFoodControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get recipe_food_show_url
    assert_response :success
  end
end
