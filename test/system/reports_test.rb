# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:report)
    @alice = users(:alice)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'

    visit reports_url
  end

  test 'visiting report lists' do
    assert_selector 'h1', text: '日報'
    assert_text @report.title
    assert_text @alice.name
  end

  test 'show a Report' do
    visit report_url(@report.id)

    assert_selector 'h1', text: '日報の詳細'
    assert_text '日報1'
    assert_text '日報1の内容'
    assert_text @alice.name
  end

  test 'creating a Report' do
    visit new_report_url

    fill_in 'タイトル', with: '日報2'
    fill_in '内容', with: '日報2の内容'
    click_on '登録する'

    assert_text '日報が作成されました。'

    assert_text '日報2'
    assert_text @alice.name
    assert_text '日報2の内容'
  end

  test 'updating a Report' do
    visit edit_report_url(@report.id)

    fill_in 'タイトル', with: '日報1を更新'
    fill_in '内容', with: '日報1の内容を更新'
    click_on '更新する'

    assert_text '日報が更新されました。'

    assert_text '日報1を更新'
    assert_text @alice.name
    assert_text '日報1の内容を更新'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
