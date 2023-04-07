# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  # Rails автоматически используют транзакционные тесты
  # self.use_transactional_tests = false
  test 'opens all bulletins page' do
    get bulletins_path
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens one note page' do
    bulletin = Bulletin.create(title: 'Title 1', body: 'Description 1')
    get bulletin_path(bulletin.id)
    assert_response :success
    assert_select 'h1', 'Title 1'
    assert_select 'p', 'Description 1'
  end

  test 'opens one note page with fixture' do
    bulletin = bulletins(:bulletin_one)
    get bulletin_path(bulletin)
    assert_response :success
    assert_select 'h1', 'Title one'
    assert_select 'p', 'Content of bulletin one'
  end
end
