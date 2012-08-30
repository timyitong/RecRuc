require 'test_helper'

class LocationMapPointsControllerTest < ActionController::TestCase
  setup do
    @location_map_point = location_map_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_map_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_map_point" do
    assert_difference('LocationMapPoint.count') do
      post :create, location_map_point: @location_map_point.attributes
    end

    assert_redirected_to location_map_point_path(assigns(:location_map_point))
  end

  test "should show location_map_point" do
    get :show, id: @location_map_point.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_map_point.to_param
    assert_response :success
  end

  test "should update location_map_point" do
    put :update, id: @location_map_point.to_param, location_map_point: @location_map_point.attributes
    assert_redirected_to location_map_point_path(assigns(:location_map_point))
  end

  test "should destroy location_map_point" do
    assert_difference('LocationMapPoint.count', -1) do
      delete :destroy, id: @location_map_point.to_param
    end

    assert_redirected_to location_map_points_path
  end
end
