class Song < ApplicationRecord
  belongs_to :album
  belongs_to :musical_gender
end
