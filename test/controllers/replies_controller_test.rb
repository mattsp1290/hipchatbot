require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @reply = replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, reply: { keywords: @reply.keywords, mention_name: @reply.mention_name, room: @reply.room, tags: @reply.tags }
    end

    assert_redirected_to reply_path(assigns(:reply))
  end

  test "should show reply" do
    get :show, id: @reply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reply
    assert_response :success
  end

  test "should update reply" do
    patch :update, id: @reply, reply: { keywords: @reply.keywords, mention_name: @reply.mention_name, room: @reply.room, tags: @reply.tags }
    assert_redirected_to reply_path(assigns(:reply))
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete :destroy, id: @reply
    end

    assert_redirected_to replies_path
  end
end
