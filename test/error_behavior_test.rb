require 'test_helper'

class ErrorBehaviorTest < ActionDispatch::IntegrationTest
  test 'should make error non-existent' do
    get '/', params: { active_limited_release: 'error_behavior' }
    assert_response 200
    assert_select 'h1', 'Hello'
  end
end
