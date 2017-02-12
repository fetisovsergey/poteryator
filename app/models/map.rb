class Map < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :longtitude, presence: true
  validates :latitude, presence: true 
  validates :radius, presence: true 
  geocoded_by :address, :skip_index => true
  reverse_geocoded_by :latitude, :longtitude
  after_validation :reverse_geocode
end
