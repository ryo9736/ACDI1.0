class User < ApplicationRecord
  validates :email, presence: true,
            length: { maximum: 30 },
            uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
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