# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting book lists' do
    assert_selector 'h1', text: '本'
    assert_text 'プロを目指す人のためのRuby入門'
    assert_text '名著です!!'
    assert_text '伊藤 淳一'
  end

  test 'show a Book' do
    visit book_url(@book)

    assert_selector 'h1', text: '本の詳細'
    assert_text 'プロを目指す人のためのRuby入門'
    assert_text '名著です!!'
    assert_text '伊藤 淳一'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '楽々ERDレッスン'
    fill_in 'メモ', with: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！'
    fill_in '著者', with: '羽生 章洋'
    click_on '登録する'
    assert_text '本が作成されました。'
    assert_text '楽々ERDレッスン'
    assert_text '実在する帳票から本当に使えるテーブル設計を導く画期的な本！'
    assert_text '羽生 章洋'
  end

  test 'updating a Book' do
    visit edit_book_url(@book)
    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'すごくわかりやすい'
    fill_in '著者', with: 'igaiga'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'Ruby超入門'
    assert_text 'すごくわかりやすい'
    assert_text 'igaiga'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text 'プロを目指す人のためのRuby入門'
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_no_text 'プロを目指す人のためのRuby入門'
    assert_text '本が削除されました。'
  end
end
