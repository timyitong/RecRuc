require 'test_helper'

class ActivityTagsControllerTest < ActionController::TestCase
  setup do
    @activity_tag = activity_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_tag" do
    assert_difference('ActivityTag.count') do
      post :create, activity_tag: @activity_tag.attributes
    end

    assert_redirected_to activity_tag_path(assigns(:activity_tag))
  end

  test "should show activity_tag" do
    get :show, id: @activity_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_tag.to_param
    assert_response :success
  end

  test "should update activity_tag" do
    put :update, id: @activity_tag.to_param, activity_tag: @activity_tag.attributes
    assert_redirected_to activity_tag_path(assigns(:activity_tag))
  end

  test "should destroy activity_tag" do
    assert_difference('ActivityTag.count', -1) do
      delete :destroy, id: @activity_tag.to_param
    end

    assert_redirected_to activity_tags_path
  end
end
