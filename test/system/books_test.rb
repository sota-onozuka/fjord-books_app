# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
    # 既存データの確認
    assert_text 'MyString'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: '買いたい本'
    fill_in 'タイトル', with: 'mens fudge 8月号'
    click_on '登録する'

    assert_text '買いたい本'
    assert_text 'mens fudge 8月号'
    assert_text '本が作成されました。'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '詳細', match: :first
    click_on '編集', match: :smart

    fill_in 'メモ', with: '買いたい本'
    fill_in 'タイトル', with: 'CLUEL homme 8月号'
    click_on '更新する'

    assert_text '買いたい本'
    assert_text 'CLUEL homme 8月号'
    assert_text '本が更新されました。'
    click_on '戻る'
    assert_text 'CLUEL homme 8月号'
  end

  test 'destroying a Book' do
    visit books_url
    click_on '新規作成'
    fill_in 'メモ', with: 'メモです'
    fill_in 'タイトル', with: 'タイトルです'
    click_on '登録する'
    click_on '戻る'

    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '本が削除されました。'
    Book.all.each do |book|
      assert_not_equal(book.title, 'タイトルです')
    end
  end
end
