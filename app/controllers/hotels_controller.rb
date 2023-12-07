class HotelsController < ApplicationController
  before_action :set_hotel, only: [ :show, :edit, :update, :destroy ]

  def index
    @hotels = Hotel.all
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      flash[:notice] = "Hotel Successfully Created"
      redirect_to hotels_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @hotel.update(hotel_params)
      flash[:notice] = "Hotel Updated Successfully"
      redirect_to hotels_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @hotel.destroy
    redirect_to hotels_path
  end

  private

  def set_hotel
    @hotel = Hotel.find_by(id: params[:id])

    unless @hotel
      flash[:alert] = "Hotel not found"
      redirect_to root_path
    end
  end

  def hotel_params
    params.require(:hotel).permit(:name, :address, :description)
  end

end