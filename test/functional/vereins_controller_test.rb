require 'test_helper'

class VereinsControllerTest < ActionController::TestCase
  setup do
    @verein = vereins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vereins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create verein" do
    assert_difference('Verein.count') do
      post :create, :verein => @verein.attributes
    end

    assert_redirected_to verein_path(assigns(:verein))
  end

  test "should show verein" do
    get :show, :id => @verein.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @verein.to_param
    assert_response :success
  end

  test "should update verein" do
    put :update, :id => @verein.to_param, :verein => @verein.attributes
    assert_redirected_to verein_path(assigns(:verein))
  end

  test "should destroy verein" do
    assert_difference('Verein.count', -1) do
      delete :destroy, :id => @verein.to_param
    end

    assert_redirected_to vereins_path
  end
end
