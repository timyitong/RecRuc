require 'test_helper'

class ActivityLivereportsControllerTest < ActionController::TestCase
  setup do
    @activity_livereport = activity_livereports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_livereports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_livereport" do
    assert_difference('ActivityLivereport.count') do
      post :create, activity_livereport: @activity_livereport.attributes
    end

    assert_redirected_to activity_livereport_path(assigns(:activity_livereport))
  end

  test "should show activity_livereport" do
    get :show, id: @activity_livereport.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_livereport.to_param
    assert_response :success
  end

  test "should update activity_livereport" do
    put :update, id: @activity_livereport.to_param, activity_livereport: @activity_livereport.attributes
    assert_redirected_to activity_livereport_path(assigns(:activity_livereport))
  end

  test "should destroy activity_livereport" do
    assert_difference('ActivityLivereport.count', -1) do
      delete :destroy, id: @activity_livereport.to_param
    end

    assert_redirected_to activity_livereports_path
  end
end
