require 'test_helper'

class TaskTypeTest < ActiveSupport::TestCase
  test "required" do
    assert_required_values(TaskType, {:name => "Tarefa 1"})
  end

  test "uniqueness" do
    assert_unique_values(TaskType, {:name => "Tarefa 1",
                                    :project_id => 1}, {:project_id => 2}, [:name])
  end

  test "length" do
    assert_valid_sizes(TaskType, {:name => "a"}, {:name => "a"*100}, {:name => "UmNomeCorreto"})
  end
end
