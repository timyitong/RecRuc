require 'test_helper'

class UserFollowTagsControllerTest < ActionController::TestCase
  setup do
    @user_follow_tag = user_follow_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_follow_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_follow_tag" do
    assert_difference('UserFollowTag.count') do
      post :create, user_follow_tag: @user_follow_tag.attributes
    end

    assert_redirected_to user_follow_tag_path(assigns(:user_follow_tag))
  end

  test "should show user_follow_tag" do
    get :show, id: @user_follow_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_follow_tag.to_param
    assert_response :success
  end

  test "should update user_follow_tag" do
    put :update, id: @user_follow_tag.to_param, user_follow_tag: @user_follow_tag.attributes
    assert_redirected_to user_follow_tag_path(assigns(:user_follow_tag))
  end

  test "should destroy user_follow_tag" do
    assert_difference('UserFollowTag.count', -1) do
      delete :destroy, id: @user_follow_tag.to_param
    end

    assert_redirected_to user_follow_tags_path
  end
end
