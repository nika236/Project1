module Hotels
  class HotelUpdateService
    attr_reader :hotel, :error
    def initialize(hotel , params)
      @hotel = hotel
      @params = params
    end

    def update_hotel
      if @hotel.update(@params)
        @hotel
      else
        false
      end
    end

  end
end