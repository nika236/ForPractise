class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  validates :room_code, uniqueness: true, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true
end
