require 'test_helper'

class UserCurlocationsControllerTest < ActionController::TestCase
  setup do
    @user_curlocation = user_curlocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_curlocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_curlocation" do
    assert_difference('UserCurlocation.count') do
      post :create, user_curlocation: @user_curlocation.attributes
    end

    assert_redirected_to user_curlocation_path(assigns(:user_curlocation))
  end

  test "should show user_curlocation" do
    get :show, id: @user_curlocation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_curlocation.to_param
    assert_response :success
  end

  test "should update user_curlocation" do
    put :update, id: @user_curlocation.to_param, user_curlocation: @user_curlocation.attributes
    assert_redirected_to user_curlocation_path(assigns(:user_curlocation))
  end

  test "should destroy user_curlocation" do
    assert_difference('UserCurlocation.count', -1) do
      delete :destroy, id: @user_curlocation.to_param
    end

    assert_redirected_to user_curlocations_path
  end
end
