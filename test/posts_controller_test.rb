# frozen_string_literal: true
require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'Successfully access' do
    get '/'
    assert_response 200
    assert_equal 'posts#index', response.body
  end

  test 'Render 500.html' do
    get '/', params: { raise_error: true }
    assert_response 500
    assert_select 'h1', '500 error'
  end
end
