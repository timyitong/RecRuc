require 'test_helper'

class LocationMapPointImgsControllerTest < ActionController::TestCase
  setup do
    @location_map_point_img = location_map_point_imgs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_map_point_imgs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_map_point_img" do
    assert_difference('LocationMapPointImg.count') do
      post :create, location_map_point_img: @location_map_point_img.attributes
    end

    assert_redirected_to location_map_point_img_path(assigns(:location_map_point_img))
  end

  test "should show location_map_point_img" do
    get :show, id: @location_map_point_img.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_map_point_img.to_param
    assert_response :success
  end

  test "should update location_map_point_img" do
    put :update, id: @location_map_point_img.to_param, location_map_point_img: @location_map_point_img.attributes
    assert_redirected_to location_map_point_img_path(assigns(:location_map_point_img))
  end

  test "should destroy location_map_point_img" do
    assert_difference('LocationMapPointImg.count', -1) do
      delete :destroy, id: @location_map_point_img.to_param
    end

    assert_redirected_to location_map_point_imgs_path
  end
end
