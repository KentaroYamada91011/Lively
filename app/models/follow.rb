class Follow < ApplicationRecord
  belongs_to :artist
  belongs_to :user
  validates :artist_id, presence:true
  validates :user_id, presence:true
end
