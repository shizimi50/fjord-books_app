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
    assert_text @book.title
    assert_text @book.memo
    assert_text @book.author
  end

  test 'show a Book' do
    visit book_url(@book.id)

    assert_selector 'h1', text: '本の詳細'
    assert_text 'プロを目指す人のためのRuby入門'
    assert_text '名著です!!'
    assert_text 'igaiga'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby on Rails'
    fill_in 'メモ', with: 'Rails初学者向け'
    fill_in '著者', with: 'Foo bar'
    click_on '登録する'
    assert_text '本が作成されました。'
    assert_text 'Ruby on Rails'
    assert_text 'Rails初学者向け'
    assert_text 'Foo bar'
  end

  test 'updating a Book' do
    visit edit_book_url(@book.id)
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
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
