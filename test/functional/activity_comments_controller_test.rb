require 'test_helper'

class ActivityCommentsControllerTest < ActionController::TestCase
  setup do
    @activity_comment = activity_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_comment" do
    assert_difference('ActivityComment.count') do
      post :create, activity_comment: @activity_comment.attributes
    end

    assert_redirected_to activity_comment_path(assigns(:activity_comment))
  end

  test "should show activity_comment" do
    get :show, id: @activity_comment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_comment.to_param
    assert_response :success
  end

  test "should update activity_comment" do
    put :update, id: @activity_comment.to_param, activity_comment: @activity_comment.attributes
    assert_redirected_to activity_comment_path(assigns(:activity_comment))
  end

  test "should destroy activity_comment" do
    assert_difference('ActivityComment.count', -1) do
      delete :destroy, id: @activity_comment.to_param
    end

    assert_redirected_to activity_comments_path
  end
end
