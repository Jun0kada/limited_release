require 'test_helper'

class HelperMethodTest < ActionDispatch::IntegrationTest
  test 'should have overrided helper method value & defined in limited release' do
    get '/', params: { active_limited_release: 'helper_method' }
    assert_response 200
    assert_select 'h1', 'Good morning'
    assert_select 'h2', 'New helper method'
  end
end
