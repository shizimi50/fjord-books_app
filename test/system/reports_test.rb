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
    assert_text 'Railsでテストを書く#1'
    assert_text 'Alice'
  end

  test 'show a Report' do
    visit report_url(@report.id)

    assert_selector 'h1', text: '日報の詳細'
    assert_text 'Railsでテストを書く#1'
    assert_text 'Railsでテストを書く（ハンズオン動画を視聴）。非常にわかりやすい解説だった。'
    assert_text 'Alice'
  end

  test 'creating a Report' do
    visit new_report_url

    fill_in 'タイトル', with: 'オブジェクト指向プログラミング'
    fill_in '内容', with: 'オブジェクト指向プログラミングはプログラミングパラダイムの一つです。現在使われている代表的なプログラミングパラダイムは3つがあります。'
    click_on '登録する'

    assert_text '日報が作成されました。'

    assert_text 'オブジェクト指向プログラミング'
    assert_text 'Alice'
    assert_text 'オブジェクト指向プログラミングはプログラミングパラダイムの一つです。現在使われている代表的なプログラミングパラダイムは3つがあります。'
  end

  test 'updating a Report' do
    visit edit_report_url(@report.id)

    fill_in 'タイトル', with: 'Railsでテストを書く#1（苦戦）'
    fill_in '内容', with: 'Railsでテストを書く（ハンズオン動画を視聴）。非常にわかりやすい解説だった。テストに関しては、もっと練習が必要そう。'
    click_on '更新する'

    assert_text '日報が更新されました。'

    assert_text 'Railsでテストを書く#1（苦戦）'
    assert_text 'Alice'
    assert_text 'Railsでテストを書く（ハンズオン動画を視聴）。非常にわかりやすい解説だった。テストに関しては、もっと練習が必要そう。'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_text 'Railsでテストを書く#1'

    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_no_text 'Railsでテストを書く#1'

    assert_text '日報が削除されました。'
  end
end
