# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get about' do
    get pages_path('about')
    assert_response :success
  end
end
