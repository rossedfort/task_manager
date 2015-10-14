require_relative '../test_helper'

class TaskTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    task = Task.new({ "id"          => "1",
                      "title"       => "something",
                      "description" => "something else"})

    assert_equal "1", task.id
    assert_equal "something", task.title
    assert_equal "something else", task.description
  end
end
