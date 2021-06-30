class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorites_pictures, through: :favorites, source: :picture
  mount_uploader :image, ImageUploader

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # def favorite(picture)
  #   favorites_pictures << board
  # end

  # def unfavorite(picture)
  #   favorites_pictures.delete(picture)
  # end

  # def favorite?(picture)
  #   favorites_pictures.include?(picture)
  # end
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  #フォローしているかどうかを確認する
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

end
