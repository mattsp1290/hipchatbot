require 'test_helper'

class HooksControllerTest < ActionController::TestCase
  setup do
    @hook = hooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hook" do
    assert_difference('Hook.count') do
      post :create, hook: { event: @hook.event, room: @hook.room, url: @hook.url }
    end

    assert_redirected_to hook_path(assigns(:hook))
  end

  test "should show hook" do
    get :show, id: @hook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hook
    assert_response :success
  end

  test "should update hook" do
    patch :update, id: @hook, hook: { event: @hook.event, room: @hook.room, url: @hook.url }
    assert_redirected_to hook_path(assigns(:hook))
  end

  test "should destroy hook" do
    assert_difference('Hook.count', -1) do
      delete :destroy, id: @hook
    end

    assert_redirected_to hooks_path
  end
end
