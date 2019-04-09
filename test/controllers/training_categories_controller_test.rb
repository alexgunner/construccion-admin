require 'test_helper'

class TrainingCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training_category = training_categories(:one)
  end

  test "should get index" do
    get training_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_training_category_url
    assert_response :success
  end

  test "should create training_category" do
    assert_difference('TrainingCategory.count') do
      post training_categories_url, params: { training_category: { name: @training_category.name } }
    end

    assert_redirected_to training_category_url(TrainingCategory.last)
  end

  test "should show training_category" do
    get training_category_url(@training_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_category_url(@training_category)
    assert_response :success
  end

  test "should update training_category" do
    patch training_category_url(@training_category), params: { training_category: { name: @training_category.name } }
    assert_redirected_to training_category_url(@training_category)
  end

  test "should destroy training_category" do
    assert_difference('TrainingCategory.count', -1) do
      delete training_category_url(@training_category)
    end

    assert_redirected_to training_categories_url
  end
end
