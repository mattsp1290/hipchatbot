require 'test_helper'

class RedditPostsControllerTest < ActionController::TestCase
  setup do
    @reddit_post = reddit_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reddit_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reddit_post" do
    assert_difference('RedditPost.count') do
      post :create, reddit_post: { subreddit: @reddit_post.subreddit, text: @reddit_post.text, url: @reddit_post.url }
    end

    assert_redirected_to reddit_post_path(assigns(:reddit_post))
  end

  test "should show reddit_post" do
    get :show, id: @reddit_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reddit_post
    assert_response :success
  end

  test "should update reddit_post" do
    patch :update, id: @reddit_post, reddit_post: { subreddit: @reddit_post.subreddit, text: @reddit_post.text, url: @reddit_post.url }
    assert_redirected_to reddit_post_path(assigns(:reddit_post))
  end

  test "should destroy reddit_post" do
    assert_difference('RedditPost.count', -1) do
      delete :destroy, id: @reddit_post
    end

    assert_redirected_to reddit_posts_path
  end
end
