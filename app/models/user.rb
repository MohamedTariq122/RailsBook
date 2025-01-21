class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar  # Active Storage
  has_many :comments, dependent: :destroy # dependent: :destroy ensures that when a user is deleted, all associated comments are also deleted
end
