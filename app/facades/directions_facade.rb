class DirectionsFacade

  def initialize(location)
    @location = location
  end

  def travel_time
    get_directions['routes'].first['legs'].first['duration']['text']
  end

  def distance
    get_directions['routes'].first['legs'].first['distance']['text']
  end

  def html_instructions
    get_directions['routes'].first['legs'].first['steps'].first['html_instructions']
  end

  def station_name
    nearest_station['fuel_stations'].first['station_name']
  end

  def fuel_type
    nearest_station['fuel_stations'].first['fuel_type_code']
  end

  def access_times
    nearest_station['fuel_stations'].first['access_days_time']
  end

  def nearest_station
    service = NRELService.new
    nearest_station = service.nearest_station(@location)
  end

  def destination
    service = NRELService.new
    destination = service.destination(@location)
  end

  def get_directions
    service = GoogleMapService.new
    directions = service.get_directions(@location, destination)
  end

end
