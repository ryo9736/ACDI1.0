class User < ApplicationRecord
  validates :email, presence: true,
                    length: { in: 1..50  },
                    uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :trainer, inclusion: {in: [true, false]}
  validates :trainee, inclusion: {in: [true, false]}
  validates :history, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :fav_posts, through: :favorites, source: :post
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :reviews, dependent: :destroy
end