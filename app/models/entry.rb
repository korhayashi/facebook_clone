class Entry < ApplicationRecord
  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, presence: true
end
