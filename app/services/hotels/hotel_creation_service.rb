module Hotels
  class HotelCreationService
    attr_reader :hotel
    def initialize(params)
      @params = params
    end

    def create_hotel
      @hotel = Hotel.new(@params)
      @hotel.save
    end
  end
end