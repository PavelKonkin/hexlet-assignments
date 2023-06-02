# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  def setup
    @response = load_fixture('files/response.json')
  end
  
  test 'should_create_repository' do
    stub_request(:get, "www.example.com").to_return({body: @response})
    get new_repository_url(link: "www.example.com")
    assert_response :success
  end

  # END
end
