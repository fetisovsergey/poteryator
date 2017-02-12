class Thing < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :longtitude, presence: true
  validates :latitude, presence: true 
  validates :root_type, presence: true, format: { with: /[1-3]/}
  validates :thing_type, presence: true, format: { with: /[1-3]/}
  validates :description, presence: true,length: { in: 2..1000 }
  geocoded_by :address, :skip_index => true
  reverse_geocoded_by :latitude, :longtitude
  after_validation :reverse_geocode

end
