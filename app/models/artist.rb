class Artist < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :events
  has_many :follows
  validates :name, presence: true
  mount_uploader :image, ImageUploader

end
