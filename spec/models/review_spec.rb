require 'rails_helper'

RSpec.describe Review, type: :model do

    it "contentが空ならバリデーションが通らない" do
        review = Review.new(
        content: '',
        )
        review.valid?
        expect(review.errors[:content]).to include("を入力してください")
      end
    
      it "contentが50文字以上ならバリデーションが通らない" do
        review = Review.new(
        content: 'テスト投稿'*11,
       )
        review.valid?
        expect(review.errors[:content]).to include("は50文字以内で入力してください")
      end

end
  # bin/rspec spec/models/review_spec.rb