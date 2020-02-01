require 'test_helper'

class ControllerOverrideTest < ActionDispatch::IntegrationTest
  test 'should override @message value' do
    get '/', params: { active_limited_release: 'controller_override' }
    assert_response 200
    assert_select 'h1', 'Good morning'
  end

  test 'should not override @message value' do
    get '/'
    assert_response 200
    assert_select 'h1', 'Hello'
  end
end
