# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン' # ボタンクラスを探す
    # click_link 'ログイン' aタグを探す
    # click_on 'ログイン'
  end

  test 'visiting the report index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'alice'
    assert_text '日報テスト'
    assert_text '日報テストの中身です。'
    click_on '戻る'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :smart

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text 'alice'
    assert_text '日報テスト'
    assert_text '日報テストの中身です。'
    click_on '戻る'
  end

  test 'destroying a report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
