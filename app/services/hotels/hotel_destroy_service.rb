module Hotels
  class HotelDestroyService
    def initialize(hotel)
      @hotel = hotel
    end

    def destroy_hotel
      @hotel.destroy
    end
  end
end