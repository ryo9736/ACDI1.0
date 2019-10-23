FactoryBot.define do
    factory :post do
      title { 'テスト投稿' }
      purpose {'テストを書き終わること'}
      current_status {'テストを書いている'}
      target {'テストを書く'}
    end
end