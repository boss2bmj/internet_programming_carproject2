require 'test_helper'

class CarStatusesControllerTest < ActionController::TestCase
  setup do
    @car_status = car_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:car_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create car_status" do
    assert_difference('CarStatus.count') do
      post :create, car_status: { description: @car_status.description, status: @car_status.status }
    end

    assert_redirected_to car_status_path(assigns(:car_status))
  end

  test "should show car_status" do
    get :show, id: @car_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @car_status
    assert_response :success
  end

  test "should update car_status" do
    patch :update, id: @car_status, car_status: { description: @car_status.description, status: @car_status.status }
    assert_redirected_to car_status_path(assigns(:car_status))
  end

  test "should destroy car_status" do
    assert_difference('CarStatus.count', -1) do
      delete :destroy, id: @car_status
    end

    assert_redirected_to car_statuses_path
  end
end
