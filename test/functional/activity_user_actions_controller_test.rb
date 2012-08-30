require 'test_helper'

class ActivityUserActionsControllerTest < ActionController::TestCase
  setup do
    @activity_user_action = activity_user_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_user_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_user_action" do
    assert_difference('ActivityUserAction.count') do
      post :create, activity_user_action: @activity_user_action.attributes
    end

    assert_redirected_to activity_user_action_path(assigns(:activity_user_action))
  end

  test "should show activity_user_action" do
    get :show, id: @activity_user_action.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_user_action.to_param
    assert_response :success
  end

  test "should update activity_user_action" do
    put :update, id: @activity_user_action.to_param, activity_user_action: @activity_user_action.attributes
    assert_redirected_to activity_user_action_path(assigns(:activity_user_action))
  end

  test "should destroy activity_user_action" do
    assert_difference('ActivityUserAction.count', -1) do
      delete :destroy, id: @activity_user_action.to_param
    end

    assert_redirected_to activity_user_actions_path
  end
end
