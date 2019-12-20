class NRELService

  def nearest_station(location)
    response = get_json(location)
  end

  def destination(location)
    street = nearest_station(location)['fuel_stations'].first['street_address']
    city = nearest_station(location)['fuel_stations'].first['city']
    state = nearest_station(location)['fuel_stations'].first['state']
    zip = nearest_station(location)['fuel_stations'].first['zip']
    location = street + ' ' +  city +  ' ' + state + ' ' + zip
  end

  private

  def conn
    Faraday.new(url: 'https://developer.nrel.gov') do |f|
      f.params['api_key'] = ENV['NREL_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(location)
    response = conn.get('/api/alt-fuel-stations/v1/nearest.json') do |f|
      f.params['location'] = location
    end
    JSON.parse(response.body)
  end

end
