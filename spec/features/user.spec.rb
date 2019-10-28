require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do

  background do
    FactoryBot.create(:user)
  end

  scenario "新規登録機能のテスト" do

    visit new_user_registration_path

    fill_in 'user_email', with: 'new@new.com'
    fill_in 'user_password', with: '101010'
    fill_in 'user_password_confirmation', with: '101010'
    check   'user_trainer'
    click_on '新規登録する'
    expect(page).to have_text "ユーザー編集"
  end

  scenario "ログイン機能のテスト" do

    visit new_user_session_path

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    expect(page).to have_text "トレーナー"
  end

  scenario "ログアウト機能のテスト" do

    visit new_user_session_path

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    click_on 'ログアウト'
    expect(page).to have_text "ログイン"
  end



  scenario "ユーザー一覧機能のテスト" do

    visit new_user_session_path

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    click_on 'ユーザー一覧'
    expect(page).to have_text "トレーナー"
  end

  scenario "ユーザー編集機能のテスト" do

    visit new_user_session_path

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    click_on 'ユーザー詳細'
    click_on 'ユーザー編集'
    attach_file 'user_image', "app/assets/images/top_page.jpg"
    fill_in 'user_name', with: 'テスト'
    fill_in 'user_history', with: '1'
    fill_in 'user_area', with: 'テスト町'
    fill_in 'user_current_password', with: '123456'
    click_on '更新する'
    expect(page).to have_text "テスト町"
  end

  scenario "ユーザー削除機能のテスト" do

    visit new_user_session_path

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    click_on 'ユーザー詳細'
    click_on 'ユーザー編集'
    click_on '削除する'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: '123456'
    click_on 'ログインする'
    expect(page).to have_text "ログイン"
  end
end

#bin/rspec spec/features/user.spec.rb
#save_and_open_page