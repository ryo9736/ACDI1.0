require 'rails_helper'

RSpec.feature "投稿機能", type: :feature do

  background do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
  end

  before do
    visit new_user_session_path

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    click_on '新規投稿'
    fill_in 'post_title', with:"テストを書く"
    fill_in 'post_purpose', with:"テストを書き終わること"
    fill_in 'post_current_status', with:"テストを書いている"
    fill_in 'post_target', with: "'テストを書く"
    fill_in 'post_tag_list', with:"上半身"
    click_on '登録する'
  end

  scenario "新規投稿機能のテスト" do
    click_on '新規投稿'
    fill_in 'post_title', with:"テストを書く"
    fill_in 'post_purpose', with:"テストを書き終わること"
    fill_in 'post_current_status', with:"テストを書いている"
    fill_in 'post_target', with: "'テストを書く"
    fill_in 'post_tag_list', with:"上半身"
    click_on '登録する'
    click_on 'アカウント情報'
    expect(page).to have_text "自宅"
  end

  scenario "投稿一覧機能のテスト" do
    click_on 'ログアウト'
    fill_in 'user_email', with: 'second@second.com'
    fill_in 'user_password', with: '678910'
    click_on 'ログインする'
    click_on '新規投稿'
    fill_in 'post_title', with:"トレニー投稿のテストを書く"
    fill_in 'post_purpose', with:"トレニー投稿のテストを書き終わること"
    fill_in 'post_current_status', with:"トレニー投稿のテストを書いている"
    fill_in 'post_target', with: "'トレニー投稿のテストを書く"
    fill_in 'post_tag_list', with:"上半身"
    click_on '登録する'
    click_on '投稿一覧'
    expect(page).to have_text "テストを書く"
    expect(page).to have_text "トレニー投稿のテストを書く"
  end

  scenario "投稿編集機能のテスト" do
    click_on '新規投稿'
    fill_in 'post_title', with:"テストを書く"
    fill_in 'post_purpose', with:"テストを書き終わること"
    fill_in 'post_current_status', with:"テストを書いている"
    fill_in 'post_target', with: "'テストを書く"
    click_on '登録する'
    click_on '編集'
    fill_in  'post_start_reason', with:"テストを書く必要があるから"
    click_on '更新する'
    expect(page).to have_text "テストを書く必要があるから"
  end

  scenario "投稿削除機能のテスト" do
    click_on '削除'
    expect(page).to have_no_text "テストを書く"
  end

  scenario "投稿お気に入り機能のテスト" do
    click_on 'ログアウト'
    fill_in 'user_email', with: 'second@second.com'
    fill_in 'user_password', with: '678910'
    click_on 'ログインする'
    click_on '投稿詳細'
    click_on 'お気に入りする'
    click_on '投稿詳細'
    expect(page).to have_text "お気に入り解除"
  end


  scenario "投稿タグ検索機能のテスト" do
    click_on 'ログアウト'
    fill_in 'user_email', with: 'second@second.com'
    fill_in 'user_password', with: '678910'
    click_on 'ログインする'
    click_on '新規投稿'
    fill_in 'post_title', with:"テストを書く"
    fill_in 'post_purpose', with:"テストを書き終わること"
    fill_in 'post_current_status', with:"テストを書いている"
    fill_in 'post_target', with: "'テストを書く"
    fill_in 'post_tag_list', with:"下半身"
    click_on '登録する'

    visit posts_path
    click_link '下半身'
    expect(page).to have_no_text "上半身"
    expect(page).to have_text "下半身"

  end






end

#bin/rspec spec/features/post.spec.rb
#save_and_open_page