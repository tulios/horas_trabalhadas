require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = 1
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
    assert_template "projects/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template "projects/new"
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, :project => { :name => "Teste de integração" }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, :id => projects(:one).to_param
    assert_response :success
    assert_template "projects/show"
  end

  test "should get edit" do
    get :edit, :id => projects(:one).to_param
    assert_response :success
    assert_template "projects/edit"
  end

  test "should update project" do
    put :update, :id => projects(:one).to_param, 
            :project => { :name => "Agora com descrição!" }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, :id => projects(:one).to_param
    end

    assert_redirected_to projects_path
  end
end
