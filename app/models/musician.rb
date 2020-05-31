class Musician < ApplicationRecord
  has_many :albums
  has_many :songs, through: :albums

  validates :name, presence: true
end
