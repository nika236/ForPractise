class BookingsController < ApplicationController
  before_action :set_booking, except: [:new, :create]
  before_action :set_room, only: [:new, :create]


  def new
    @booking = Booking.new
  end
  def edit
  end

  def create
    @booking = @room.bookings.build(booking_params)
    @booking.generate_booking_code
    if @booking.save
      flash[:notice] = "Booked Successfully"
      redirect_to @booking.room
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def update
    if @booking.update(booking_params)
      flash[:notice] = "Booking updated Successfully"
      redirect_to @booking.room
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_back fallback_location: @booking.room
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_code, :total_price,)
  end

  def set_booking
    @booking = Booking.find_by(id: params[:id])

    unless @booking
      flash[:alert] = "Booking not found"
      redirect_to root_path
    end
  end

  def set_room
    @room = Room.find_by(id: params[:room_id])

    unless @room
      flash[:alert] = "Room not found"
      redirect_to root_path
    end
  end
end
