require 'test_helper'

class UserGroupFollowsControllerTest < ActionController::TestCase
  setup do
    @user_group_follow = user_group_follows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_group_follows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_group_follow" do
    assert_difference('UserGroupFollow.count') do
      post :create, user_group_follow: @user_group_follow.attributes
    end

    assert_redirected_to user_group_follow_path(assigns(:user_group_follow))
  end

  test "should show user_group_follow" do
    get :show, id: @user_group_follow.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_group_follow.to_param
    assert_response :success
  end

  test "should update user_group_follow" do
    put :update, id: @user_group_follow.to_param, user_group_follow: @user_group_follow.attributes
    assert_redirected_to user_group_follow_path(assigns(:user_group_follow))
  end

  test "should destroy user_group_follow" do
    assert_difference('UserGroupFollow.count', -1) do
      delete :destroy, id: @user_group_follow.to_param
    end

    assert_redirected_to user_group_follows_path
  end
end
