class RoomsController < ApplicationController
  before_action :set_hotel, only:[:new, :create]
  before_action :set_room, only: [:edit, :update, :show , :destroy]


  def show
  end

  def edit
  end

  def new
    @room = Room.new
  end

  def create
    @room = @hotel.rooms.build(room_params)
    if @room.save
      flash[:notice] = "Room Successfully Created For #{@hotel.name} Hotel"
      redirect_to @room.hotel
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Room Successfully Updated For #{@room.hotel.name} Hotel"
      redirect_to @room.hotel
    else
      render 'edit', status: :unprocessable_entity
    end
  end


  def destroy
    @room.destroy
    redirect_back fallback_location: hotels_path
  end

  private

  def room_params
    params.require(:room).permit(:room_code, :description,:price_per_night)
  end

  def set_room
    @room = Room.find_by(id: params[:id])

    unless @room
      flash[:alert] = "Room not found"
      redirect_to root_path
    end
  end

  def set_hotel
    @hotel = Hotel.find_by(id: params[:hotel_id])

    unless @hotel
      flash[:alert] = "Hotel not found"
      redirect_to root_path
    end
  end
end
