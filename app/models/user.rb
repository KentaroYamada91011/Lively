class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
         devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :trackable, :validatable

    validates :name, presence: true
    validates :start_time, presence: true
  has_many :likes, dependent: :destroy
  has_many :follows, dependent: :destroy

  has_many :following_artists, through: :follows, source: :artist
  mount_uploader :image, ImageUploader

end
