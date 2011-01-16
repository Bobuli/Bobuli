require 'test_helper'

class TippsControllerTest < ActionController::TestCase
  setup do
    @tipp = tipps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipp" do
    assert_difference('Tipp.count') do
      post :create, :tipp => @tipp.attributes
    end

    assert_redirected_to tipp_path(assigns(:tipp))
  end

  test "should show tipp" do
    get :show, :id => @tipp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipp.to_param
    assert_response :success
  end

  test "should update tipp" do
    put :update, :id => @tipp.to_param, :tipp => @tipp.attributes
    assert_redirected_to tipp_path(assigns(:tipp))
  end

  test "should destroy tipp" do
    assert_difference('Tipp.count', -1) do
      delete :destroy, :id => @tipp.to_param
    end

    assert_redirected_to tipps_path
  end
end
