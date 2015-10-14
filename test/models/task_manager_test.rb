require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def create_tasks(num)
    num.times do |i|
      TaskManager.create({:title       => "task",
                          :description => "stuff"})
    end
  end

  def test_task_is_created
    TaskManager.create({:title       => "task",
                        :description => "stuff"})

    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "task", task.title
    assert_equal "stuff", task.description
  end

  def test_a_task_can_be_updated
    TaskManager.create({:title       => "task",
                        :description => "stuff"})

    TaskManager.update(1, {:title       => "updated task",
                           :description => "updated stuff"})

    task = TaskManager.find(1)

    assert_equal 1, task.id
    assert_equal "updated task", task.title
    assert_equal "updated stuff", task.description
  end

  def test_a_task_can_be_deleted
    TaskManager.create({:title       => "task",
                        :description => "stuff"})

    TaskManager.create({:title       => "another task",
                        :description => "more stuff"})

    TaskManager.delete(1)

    assert_equal 1, TaskManager.all.count
  end

  def test_all_tasks_can_be_returned
    skip
    TaskManager.create({:title       => "task",
                        :description => "stuff"})

    TaskManager.create({:title       => "another task",
                        :description => "more stuff"})

    task_one = TaskManager.find(1)
    task_two = TaskManager.find(2)

    expected = [task_one, task_two]

    assert_equal expected, TaskManager.all
  end
end
