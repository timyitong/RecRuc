require 'test_helper'

class ActivityRefsControllerTest < ActionController::TestCase
  setup do
    @activity_ref = activity_refs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_refs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_ref" do
    assert_difference('ActivityRef.count') do
      post :create, activity_ref: @activity_ref.attributes
    end

    assert_redirected_to activity_ref_path(assigns(:activity_ref))
  end

  test "should show activity_ref" do
    get :show, id: @activity_ref.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_ref.to_param
    assert_response :success
  end

  test "should update activity_ref" do
    put :update, id: @activity_ref.to_param, activity_ref: @activity_ref.attributes
    assert_redirected_to activity_ref_path(assigns(:activity_ref))
  end

  test "should destroy activity_ref" do
    assert_difference('ActivityRef.count', -1) do
      delete :destroy, id: @activity_ref.to_param
    end

    assert_redirected_to activity_refs_path
  end
end
