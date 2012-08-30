require 'test_helper'

class ActivityTweetsControllerTest < ActionController::TestCase
  setup do
    @activity_tweet = activity_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_tweet" do
    assert_difference('ActivityTweet.count') do
      post :create, activity_tweet: @activity_tweet.attributes
    end

    assert_redirected_to activity_tweet_path(assigns(:activity_tweet))
  end

  test "should show activity_tweet" do
    get :show, id: @activity_tweet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_tweet.to_param
    assert_response :success
  end

  test "should update activity_tweet" do
    put :update, id: @activity_tweet.to_param, activity_tweet: @activity_tweet.attributes
    assert_redirected_to activity_tweet_path(assigns(:activity_tweet))
  end

  test "should destroy activity_tweet" do
    assert_difference('ActivityTweet.count', -1) do
      delete :destroy, id: @activity_tweet.to_param
    end

    assert_redirected_to activity_tweets_path
  end
end
