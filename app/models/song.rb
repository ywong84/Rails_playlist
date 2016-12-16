class Song < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :playinglists
  has_many :song_users, through: :playinglists, source: :user
  validates :artist, :title, presence: true
end
