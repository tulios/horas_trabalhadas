require 'test_helper'

class TaskTypesControllerTest < ActionController::TestCase
  def setup
    @request.session[:user_id] = 1
  end
  
  test "should get index" do
    get :index, :project_id => 1
    assert_response :success
    assert_not_nil assigns(:task_types)
  end

  test "should get new" do
    get :new, :project_id => 1
    assert_response :success
    assert_tag :form,
      :attributes => { :action => project_task_types_path(projects(:one))}
  end

  test "should create task_type" do
    assert_difference('TaskType.count') do
      post :create, :project_id => 1, :task_type => { :name => "Nova Task",
                                                      :project_id => 1}
    end

    assert_redirected_to project_path(assigns(:task_type).project)
  end

  test "should get edit" do
    get :edit, :id => task_types(:one).to_param
    assert_response :success
  end

  test "should update task_type" do
    put :update, :id => 1, :task_type => { :name => "Outro nome" }
    assert_redirected_to project_path(assigns(:task_type).project)
    assert_equal "Outro nome", assigns(:task_type).name
  end

  test "should destroy task_type" do
    assert_difference('TaskType.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to project_path(assigns(:task_type).project)
  end
end
