require_relative '../test_helper'

class DeleteTaskTest < FeatureTest
  def test_a_task_can_be_deleted
    TaskManager.create({:title       => "task",
                        :description => "stuff"})

    visit '/tasks'
    assert_equal '/tasks', current_path

    click_link_or_button('Delete')

    refute page.has_content?('task')
  end
end
