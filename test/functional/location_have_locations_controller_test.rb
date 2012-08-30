require 'test_helper'

class LocationHaveLocationsControllerTest < ActionController::TestCase
  setup do
    @location_have_location = location_have_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_have_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_have_location" do
    assert_difference('LocationHaveLocation.count') do
      post :create, location_have_location: @location_have_location.attributes
    end

    assert_redirected_to location_have_location_path(assigns(:location_have_location))
  end

  test "should show location_have_location" do
    get :show, id: @location_have_location.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_have_location.to_param
    assert_response :success
  end

  test "should update location_have_location" do
    put :update, id: @location_have_location.to_param, location_have_location: @location_have_location.attributes
    assert_redirected_to location_have_location_path(assigns(:location_have_location))
  end

  test "should destroy location_have_location" do
    assert_difference('LocationHaveLocation.count', -1) do
      delete :destroy, id: @location_have_location.to_param
    end

    assert_redirected_to location_have_locations_path
  end
end
