require 'test_helper'

class AddPathTest < ActionDispatch::IntegrationTest
  test 'should have link to good_morning page' do
    get '/', params: { active_limited_release: 'add_path' }
    assert_response 200
    assert_select 'a', 'link to good morning page'
  end

  test 'should access good_morning page' do
    get '/good_morning', params: { active_limited_release: 'add_path' }
    assert_response 200
    assert_select 'h1', 'Good morning'
  end

  test 'should not have link to good_morning page' do
    get '/'
    assert_response 200
    assert_select 'a[href="/good_morning"]', false, 'link to good morning page'
  end

  test 'should not access good_morning page' do
    assert_raises ActionController::RoutingError do
      get '/good_morning'
    end
  end
end
