require_relative '../test_helper'

class EditTaskTest < FeatureTest
  def test_a_task_can_be_edited
    TaskManager.create({:title       => "task",
                        :description => "stuff"})

    visit '/tasks'
    assert_equal '/tasks', current_path

    click_link('edit')

    assert_equal '/tasks/1/edit', current_path

    fill_in('task[title]', with: 'edited title')
    fill_in('task[description]', with: 'edited description')
    click_link_or_button('submit')

    assert '/tasks', current_path
    assert page.has_content?('edited title')

    visit '/tasks/1'
    assert page.has_content?('edited title')
    assert page.has_content?('edited description')
  end
end
