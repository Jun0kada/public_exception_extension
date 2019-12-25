# frozen_string_literal: true
require 'test_helper'

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  test 'Successfully access' do
    get '/admin'
    assert_response 200
    assert_equal 'admin/posts#index', response.body
  end

  test 'Render admin/500.html' do
    get '/admin', params: { raise_error: true }
    assert_response 500
    assert_select 'h1', 'Admin 500 error'
  end
end
