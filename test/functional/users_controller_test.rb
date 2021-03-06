require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = 1
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
      post :create, :user => { :login => "testuser", :name => "Test User",
                               :password => "123123", :email => "any@email.com"}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, :id => users(:user1).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:user1).to_param
    assert_response :success
  end

  test "should update user" do
    put :update, :id => users(:user1).to_param, :user => { :name => "Outro nome" }
    assert_redirected_to user_path(assigns(:user))
    assert_equal "Outro nome", assigns(:user).name
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:user1).to_param
    end

    assert_redirected_to users_path
  end
end
