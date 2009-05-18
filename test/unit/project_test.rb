require 'test_helper'
require 'project'

class ProjectTest < ActiveSupport::TestCase
  test "presence" do
    assert_required_values(Project, :name => "testSaved")
  end

  test "uniqueness" do
    assert_unique_values(Project, {:name => "Projeto legal"},
                                  {:name => "Projeto de testes"}, [:name])
  end

  test "length" do
    p = Project.new(:name => "a")

    assert !p.valid?
    assert p.errors.invalid?(:name)

    p.name = "a" * 55

    assert !p.valid?
    assert p.errors.invalid?(:name)

    p.name = "a" * 20

    assert p.valid?
    assert !p.errors.invalid?(:name)
  end
end







