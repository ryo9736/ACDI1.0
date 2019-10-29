class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  acts_as_taggable
  validates :title,presence: true,
             length: { in: 1..50 }
  validates :purpose,presence: true,
             length: { in: 1..300 }
  validates :current_status,presence: true,
             length: { in: 1..300 }
  validates :target,presence: true,
             length: { in: 1..300 }
end
