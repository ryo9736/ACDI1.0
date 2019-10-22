class Review < ApplicationRecord
  validates :content,presence: true,
             length: { in: 1..50 }
  belongs_to :user
end
