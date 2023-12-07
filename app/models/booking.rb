class Booking < ApplicationRecord
  belongs_to :room
  validates :room_price, presence: true
  validates :total_price, presence: true
  validates :booking_code, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  before_validation :generate_booking_code, on: :create
  before_validation :room_price_for_booking
  before_validation :calculate_total_price


  def generate_booking_code
    loop do
      random_code = rand(1...100)
      new_code = "%02d" % random_code
      unless Booking.exists?(booking_code: new_code)
        self.booking_code = new_code
        break
      end
    end
  end


  def calculate_total_price
    return unless start_date.present? && end_date.present?
    self.total_price = room.price_per_night * (end_date.to_date - start_date.to_date).to_i
  end

  def room_price_for_booking
    return  unless room.price_per_night.present?
    self.room_price = room.price_per_night.freeze
  end
end
