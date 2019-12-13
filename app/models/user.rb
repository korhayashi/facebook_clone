class User < ApplicationRecord
  has_many :entries
  validates :family_name, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :gender, presence: true
end
