require 'test_helper'

class TippgemeinschaftsControllerTest < ActionController::TestCase
  setup do
    @tippgemeinschaft = tippgemeinschafts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tippgemeinschafts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tippgemeinschaft" do
    assert_difference('Tippgemeinschaft.count') do
      post :create, :tippgemeinschaft => @tippgemeinschaft.attributes
    end

    assert_redirected_to tippgemeinschaft_path(assigns(:tippgemeinschaft))
  end

  test "should show tippgemeinschaft" do
    get :show, :id => @tippgemeinschaft.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tippgemeinschaft.to_param
    assert_response :success
  end

  test "should update tippgemeinschaft" do
    put :update, :id => @tippgemeinschaft.to_param, :tippgemeinschaft => @tippgemeinschaft.attributes
    assert_redirected_to tippgemeinschaft_path(assigns(:tippgemeinschaft))
  end

  test "should destroy tippgemeinschaft" do
    assert_difference('Tippgemeinschaft.count', -1) do
      delete :destroy, :id => @tippgemeinschaft.to_param
    end

    assert_redirected_to tippgemeinschafts_path
  end
end
