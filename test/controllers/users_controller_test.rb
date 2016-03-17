# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string
#  last_name     :string
#  gender        :text
#  birth_date    :date
#  email         :string
#  mobile_number :integer
#  password      :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { birth_date: @user.birth_date, email: @user.email, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, mobile_number: @user.mobile_number, password: @user.password }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { birth_date: @user.birth_date, email: @user.email, first_name: @user.first_name, gender: @user.gender, last_name: @user.last_name, mobile_number: @user.mobile_number, password: @user.password }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
