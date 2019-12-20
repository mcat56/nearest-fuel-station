class GoogleMapService

  def get_directions(origin,destination)
    response = get_json(origin, destination)
  end

  private

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps') do |f|
      f.params['key'] = ENV['GOOGLE_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end


  def get_json(origin, destination)
    response = conn.get('api/directions/json') do |f|
      f.params['origin'] = origin
      f.params['destination'] = destination
    end
    JSON.parse(response.body)
  end
end
