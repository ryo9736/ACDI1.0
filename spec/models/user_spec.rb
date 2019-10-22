require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(
      email:   "test@test.com",
      password: '123456',
      password_confirmation: '123456',
    )
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new(
      email: '',
      password: '123456',
      password_confirmation: '123456',)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "重複したemailならバリデーションが通らない" do
    user = User.new(email: "test@test.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

   describe "mail" do
    context "正しいフォーマット" do
      it "is OK" do
        @user.email = 'test@example.com'
        expect(@user).to be_valid
      end
    end
    context "不正なフォーマット" do
      it "is NG" do
        @user.email = 'test@example,com'
        expect(@user).to_not be_valid
        expect(@user.errors[:email]).to include("は不正な値です")
      end
    end
  end

  it "passwordが空ならバリデーションが通らない" do
    user = User.new(
      email: 'test@test.com',
      password: '',
      password_confirmation: '',)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "passwordが6文字未満ならバリデーションが通らない" do
    user = User.new(
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345',)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "password_confirmationがpasswordと一致しなければバリデーションが通らない" do
    user = User.new(
      email: 'test@test.com',
      password: '123456',
      password_confirmation: '123456789',)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

end

# bin/rspec spec/models/user_spec.rb