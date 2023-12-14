class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]

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
    hotel_create = Hotels::HotelCreationService.new(hotel_params)

    respond_to do |format|
      if hotel_create.create_hotel
        format.html { redirect_to hotel_url(hotel_create.hotel.id), notice: "Hotel was successfully created." }
        format.json { render :show, status: :created, location: hotel_create.hotel.id }
      else
        @hotel = hotel_create.hotel
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    hotel_update = Hotels::HotelUpdateService.new(@hotel, hotel_params)
    respond_to do |format|
      if hotel_update.update_hotel
        format.html { redirect_to hotel_url(@hotel), notice: "Hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    hotel_destroy = Hotels::HotelDestroyService.new(@hotel)
    hotel_destroy.destroy_hotel
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :address, :description)
    end
end
