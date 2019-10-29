class Review < ApplicationRecord
  belongs_to :user
  validates :content,presence: true,
             length: { in: 1..50 }
end
