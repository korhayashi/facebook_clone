class User < ApplicationRecord
  has_many :entries
  has_many :goods, dependent: :destroy

  validates :family_name, presence: true, length: { maximum: 15 }, on: :create
  validates :first_name, presence: true, length: { maximum: 15 }, on: :create
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true, on: :create
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: { minimum: 6 }, allow_blank: true, on: :update
  validates :birth_year, presence: true, on: :create
  validates :birth_month, presence: true, on: :create
  validates :birth_day, presence: true, on: :create
  validates :gender, presence: true, on: :create
  validates :user_image, presence: true, on: :update
  mount_uploader :user_image, ImageUploader
end
