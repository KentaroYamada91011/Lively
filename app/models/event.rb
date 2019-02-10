class Event < ApplicationRecord
  belongs_to :artist
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :start_time, presence: true
  #
  # def like_user(user_id)
  #   #すでにいいねしているかどうか確認する。
  #   likes.find_by(user_id: user_id)
  # end
end
