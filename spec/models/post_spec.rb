require 'rails_helper'

RSpec.describe Post, type: :model do

  it "titleが空ならバリデーションが通らない" do
    post = Post.new(
    title: '',
    purpose: 'テストを書き終える',
    current_status: 'テストを書いている',
    target: 'テストを書く',)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "titleが50文字以上ならバリデーションが通らない" do
    post = Post.new(
    title: 'テスト投稿'*51,
    purpose: 'テストを書き終える',
    current_status: 'テストを書いている',
    target: 'テストを書く',)
    post.valid?
    expect(post.errors[:title]).to include("は50文字以内で入力してください")
  end

  it "purposeが空ならバリデーションを通らない" do
    post = Post.new(
    title: 'テスト投稿',
    purpose: '',
    current_status: 'テストを書いている',
    target: 'テストを書く',)
    post.valid?
    expect(post.errors[:purpose]).to include("を入力してください")
  end

  it "purposeが300文字以上ならバリデーションを通らない" do
    post = Post.new(
    title: 'テスト投稿',
    purpose: 'テストを書き終える'*34,
    current_status: 'テストを書いている',
    target: 'テストを書く',)
    post.valid?
    expect(post.errors[:purpose]).to include("は300文字以内で入力してください")
  end

  it "current_statusが空ならバリデーションを通らない" do
    post = Post.new(
    title: 'テスト投稿',
    purpose: 'テストを書き終える',
    current_status: '',
    target: 'テストを書く',)
    post.valid?
    expect(post.errors[:current_status]).to include("を入力してください")
  end

  it "current_statusが300文字以上ならバリデーションを通らない" do
    post = Post.new(
    title: 'テスト投稿',
    purpose: 'テストを書き終える',
    current_status: 'テストを書いている'*34,
    target: 'テストを書く',)
    post.valid?
    expect(post.errors[:current_status]).to include("は300文字以内で入力してください")
  end

  it "targetが空ならバリデーションを通らない" do
    post = Post.new(
    title: 'テスト投稿',
    purpose: 'テストを書き終える',
    current_status: 'テストを書いている',
    target: '',)
    post.valid?
    expect(post.errors[:target]).to include("を入力してください")
  end

  it "targetが300文字以上ならバリデーションを通らない" do
    post = Post.new(
    title: 'テスト投稿',
    purpose: 'テストを書き終える',
    current_status: 'テストを書いている',
    target: 'テストを書く'*51,)
    post.valid?
    expect(post.errors[:target]).to include("は300文字以内で入力してください")
  end

end
  
  # bin/rspec spec/models/post_spec.rb