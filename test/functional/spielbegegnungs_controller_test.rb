require 'test_helper'

class SpielbegegnungsControllerTest < ActionController::TestCase
  setup do
    @spielbegegnung = spielbegegnungs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spielbegegnungs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spielbegegnung" do
    assert_difference('Spielbegegnung.count') do
      post :create, :spielbegegnung => @spielbegegnung.attributes
    end

    assert_redirected_to spielbegegnung_path(assigns(:spielbegegnung))
  end

  test "should show spielbegegnung" do
    get :show, :id => @spielbegegnung.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @spielbegegnung.to_param
    assert_response :success
  end

  test "should update spielbegegnung" do
    put :update, :id => @spielbegegnung.to_param, :spielbegegnung => @spielbegegnung.attributes
    assert_redirected_to spielbegegnung_path(assigns(:spielbegegnung))
  end

  test "should destroy spielbegegnung" do
    assert_difference('Spielbegegnung.count', -1) do
      delete :destroy, :id => @spielbegegnung.to_param
    end

    assert_redirected_to spielbegegnungs_path
  end
end
