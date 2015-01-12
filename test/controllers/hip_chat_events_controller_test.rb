require 'test_helper'

class HipChatEventsControllerTest < ActionController::TestCase
  setup do
    @hip_chat_event = hip_chat_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hip_chat_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hip_chat_event" do
    assert_difference('HipChatEvent.count') do
      post :create, hip_chat_event: { date: @hip_chat_event.date, mention_name: @hip_chat_event.mention_name, message: @hip_chat_event.message, room: @hip_chat_event.room, webhook_type: @hip_chat_event.webhook_type, webhook_id: @hip_chat_event.webhook_id }
    end

    assert_redirected_to hip_chat_event_path(assigns(:hip_chat_event))
  end

  test "should show hip_chat_event" do
    get :show, id: @hip_chat_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hip_chat_event
    assert_response :success
  end

  test "should update hip_chat_event" do
    patch :update, id: @hip_chat_event, hip_chat_event: { date: @hip_chat_event.date, mention_name: @hip_chat_event.mention_name, message: @hip_chat_event.message, room: @hip_chat_event.room, type: @hip_chat_event.type, webhook_id: @hip_chat_event.webhook_id }
    assert_redirected_to hip_chat_event_path(assigns(:hip_chat_event))
  end

  test "should destroy hip_chat_event" do
    assert_difference('HipChatEvent.count', -1) do
      delete :destroy, id: @hip_chat_event
    end

    assert_redirected_to hip_chat_events_path
  end
end
