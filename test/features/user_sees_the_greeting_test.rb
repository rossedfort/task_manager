require_relative '../test_helper'

class GreetingTest < FeatureTest
  def test_user_sees_the_greeting
    visit '/'

    within('#greeting') do
      page.has_content?('Welcome to the Task Manager!')
    end
  end
end
