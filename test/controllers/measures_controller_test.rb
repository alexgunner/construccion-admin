require 'test_helper'

class MeasuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measure = measure_units(:one)
  end

  test "should get index" do
    get measure_units_url
    assert_response :success
  end

  test "should get new" do
    get new_measure_url
    assert_response :success
  end

  test "should create measure" do
    assert_difference('Measure.count') do
      post measure_units_url, params: { measure: { abbreviation: @measure.abbreviation, name: @measure.name } }
    end

    assert_redirected_to measure_url(Measure.last)
  end

  test "should show measure" do
    get measure_url(@measure)
    assert_response :success
  end

  test "should get edit" do
    get edit_measure_url(@measure)
    assert_response :success
  end

  test "should update measure" do
    patch measure_url(@measure), params: { measure: { abbreviation: @measure.abbreviation, name: @measure.name } }
    assert_redirected_to measure_url(@measure)
  end

  test "should destroy measure" do
    assert_difference('Measure.count', -1) do
      delete measure_url(@measure)
    end

    assert_redirected_to measure_units_url
  end
end
