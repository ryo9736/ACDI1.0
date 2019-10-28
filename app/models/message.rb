class Message < ApplicationRecord
  validates :content,presence: true,
  length: { in: 1..200 }
  belongs_to :user
  belongs_to :room
end
