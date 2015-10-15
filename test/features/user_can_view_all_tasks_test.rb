require_relative '../test_helper'

class ViewTasksTest < FeatureTest
  def test_all_tasks_can_be_viewed
    TaskManager.create({:title       => "task",
                        :description => "stuff"})
    TaskManager.create({:title       => "another task",
                        :description => "stuff"})

    visit '/tasks'

    assert page.has_content?('task')
    assert page.has_content?('another task')
  end
end
