require_relative '../test_helper'

class CreateTest < FeatureTest
  def test_a_task_can_be_created
    visit '/tasks/new'
    assert_equal '/tasks/new', current_path

    page.fill_in('task[title]', with: "Task Title")
    page.fill_in('task[description]', with: "Task Description")
    click_link_or_button('submit')

    assert_equal '/tasks', current_path

    assert page.has_content?('Task Title')

    visit '/tasks/1'
    assert page.has_content?('Task Title')
    assert page.has_content?('Task Description')
  end
end
