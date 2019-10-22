require 'rails_helper'

RSpec.describe User, type: :model do

  it "emailが空ならバリデーションを通らない" do
    user = User.new(
      name: 'テストユーザー',
      email: '',
      password: '123456',
      password_confirmation: '123456',)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "passwordが6文字未満ならバリデーションを通らない" do
    user = User.new(
      name: 'テストユーザー',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345',)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "password_confirmationがpasswordと一致しなければバリデーションを通らない" do
    user = User.new(
      name: 'テストユーザー',
      email: 'test@test.com',
      password: '123456',
      password_confirmation: '123456789',)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
end

# bin/rspec spec/models/user_spec.rb