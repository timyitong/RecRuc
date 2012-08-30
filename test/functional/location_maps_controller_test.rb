require 'test_helper'

class LocationMapsControllerTest < ActionController::TestCase
  setup do
    @location_map = location_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_map" do
    assert_difference('LocationMap.count') do
      post :create, location_map: @location_map.attributes
    end

    assert_redirected_to location_map_path(assigns(:location_map))
  end

  test "should show location_map" do
    get :show, id: @location_map.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_map.to_param
    assert_response :success
  end

  test "should update location_map" do
    put :update, id: @location_map.to_param, location_map: @location_map.attributes
    assert_redirected_to location_map_path(assigns(:location_map))
  end

  test "should destroy location_map" do
    assert_difference('LocationMap.count', -1) do
      delete :destroy, id: @location_map.to_param
    end

    assert_redirected_to location_maps_path
  end
end
