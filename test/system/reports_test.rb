# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the report index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    # 既存データの確認
    assert_text '日報テスト'
  end

  test 'creating a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '今日の夕飯'
    fill_in '内容', with: '大根ステーキ'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '今日の夕飯'
    assert_text '大根ステーキ'
    click_on '戻る'
  end

  test 'updating a Report' do
    # 新規作成
    visit reports_url
    click_on '編集', match: :smart
    fill_in 'タイトル', with: '今日の朝食'
    fill_in '内容', with: '納豆ご飯'
    click_on '更新する'
    assert_text '日報が更新されました。'
    assert_text '今日の朝食'
    assert_text '納豆ご飯'
    click_on '戻る'
  end

  test 'destroying a report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '削除テスト用'
    fill_in '内容', with: '削除します！'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '削除テスト用'
    assert_text '削除します！'
    click_on '戻る'

    page.accept_confirm do
      click_on '削除', match: :first
    end
    assert_text '日報が削除されました。'
    Report.all.each do |report|
      assert_not_equal(report.title, '削除テスト用')
    end
  end
end
