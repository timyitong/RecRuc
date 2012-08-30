require 'test_helper'

class ActivityGroupsControllerTest < ActionController::TestCase
  setup do
    @activity_group = activity_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_group" do
    assert_difference('ActivityGroup.count') do
      post :create, activity_group: @activity_group.attributes
    end

    assert_redirected_to activity_group_path(assigns(:activity_group))
  end

  test "should show activity_group" do
    get :show, id: @activity_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_group.to_param
    assert_response :success
  end

  test "should update activity_group" do
    put :update, id: @activity_group.to_param, activity_group: @activity_group.attributes
    assert_redirected_to activity_group_path(assigns(:activity_group))
  end

  test "should destroy activity_group" do
    assert_difference('ActivityGroup.count', -1) do
      delete :destroy, id: @activity_group.to_param
    end

    assert_redirected_to activity_groups_path
  end
end
