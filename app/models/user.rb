class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture
  mount_uploader :image, ImageUploader

  # def favorite(picture)
  #   favorites_pictures << board
  # end

  # def unfavorite(picture)
  #   favorites_pictures.delete(picture)
  # end

  # def favorite?(picture)
  #   favorites_pictures.include?(picture)
  # end

end
