require 'test_helper'

class UserFollowLocationsControllerTest < ActionController::TestCase
  setup do
    @user_follow_location = user_follow_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_follow_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_follow_location" do
    assert_difference('UserFollowLocation.count') do
      post :create, user_follow_location: @user_follow_location.attributes
    end

    assert_redirected_to user_follow_location_path(assigns(:user_follow_location))
  end

  test "should show user_follow_location" do
    get :show, id: @user_follow_location.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_follow_location.to_param
    assert_response :success
  end

  test "should update user_follow_location" do
    put :update, id: @user_follow_location.to_param, user_follow_location: @user_follow_location.attributes
    assert_redirected_to user_follow_location_path(assigns(:user_follow_location))
  end

  test "should destroy user_follow_location" do
    assert_difference('UserFollowLocation.count', -1) do
      delete :destroy, id: @user_follow_location.to_param
    end

    assert_redirected_to user_follow_locations_path
  end
end
