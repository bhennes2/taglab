require 'test_helper'

class QuickTagsControllerTest < ActionController::TestCase
  setup do
    @quick_tag = quick_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quick_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quick_tag" do
    assert_difference('QuickTag.count') do
      post :create, :quick_tag => @quick_tag.attributes
    end

    assert_redirected_to quick_tag_path(assigns(:quick_tag))
  end

  test "should show quick_tag" do
    get :show, :id => @quick_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @quick_tag.to_param
    assert_response :success
  end

  test "should update quick_tag" do
    put :update, :id => @quick_tag.to_param, :quick_tag => @quick_tag.attributes
    assert_redirected_to quick_tag_path(assigns(:quick_tag))
  end

  test "should destroy quick_tag" do
    assert_difference('QuickTag.count', -1) do
      delete :destroy, :id => @quick_tag.to_param
    end

    assert_redirected_to quick_tags_path
  end
end
