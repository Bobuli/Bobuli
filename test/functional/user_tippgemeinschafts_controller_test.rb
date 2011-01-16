require 'test_helper'

class UserTippgemeinschaftsControllerTest < ActionController::TestCase
  setup do
    @user_tippgemeinschaft = user_tippgemeinschafts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_tippgemeinschafts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_tippgemeinschaft" do
    assert_difference('UserTippgemeinschaft.count') do
      post :create, :user_tippgemeinschaft => @user_tippgemeinschaft.attributes
    end

    assert_redirected_to user_tippgemeinschaft_path(assigns(:user_tippgemeinschaft))
  end

  test "should show user_tippgemeinschaft" do
    get :show, :id => @user_tippgemeinschaft.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user_tippgemeinschaft.to_param
    assert_response :success
  end

  test "should update user_tippgemeinschaft" do
    put :update, :id => @user_tippgemeinschaft.to_param, :user_tippgemeinschaft => @user_tippgemeinschaft.attributes
    assert_redirected_to user_tippgemeinschaft_path(assigns(:user_tippgemeinschaft))
  end

  test "should destroy user_tippgemeinschaft" do
    assert_difference('UserTippgemeinschaft.count', -1) do
      delete :destroy, :id => @user_tippgemeinschaft.to_param
    end

    assert_redirected_to user_tippgemeinschafts_path
  end
end
