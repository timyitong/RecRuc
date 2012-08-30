require 'test_helper'

class UserFollowUsersControllerTest < ActionController::TestCase
  setup do
    @user_follow_user = user_follow_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_follow_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_follow_user" do
    assert_difference('UserFollowUser.count') do
      post :create, user_follow_user: @user_follow_user.attributes
    end

    assert_redirected_to user_follow_user_path(assigns(:user_follow_user))
  end

  test "should show user_follow_user" do
    get :show, id: @user_follow_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_follow_user.to_param
    assert_response :success
  end

  test "should update user_follow_user" do
    put :update, id: @user_follow_user.to_param, user_follow_user: @user_follow_user.attributes
    assert_redirected_to user_follow_user_path(assigns(:user_follow_user))
  end

  test "should destroy user_follow_user" do
    assert_difference('UserFollowUser.count', -1) do
      delete :destroy, id: @user_follow_user.to_param
    end

    assert_redirected_to user_follow_users_path
  end
end
