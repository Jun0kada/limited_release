require 'test_helper'

class ViewOverrideTest < ActionDispatch::IntegrationTest
  test 'should have overrided content' do
    get '/', params: { active_limited_release: 'view_override' }
    assert_response 200
    assert_select 'h1', 'Hello in view override'
  end

  test 'should not have overrided content' do
    get '/'
    assert_response 200
    assert_select 'h1', 'Hello'
  end
end
