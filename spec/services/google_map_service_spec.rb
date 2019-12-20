require 'rails_helper'


describe 'Google Map API makes successful calls' do
  it 'can get directions', :vcr do
    service = GoogleMapService.new
    directions = service.get_directions('Hollywood', 'Disneyland')

    expect(directions).to be_a(Hash)
    expect(directions).to have_key('routes')
    expect(directions['routes'].first['legs'].first).to have_key('duration')
    expect(directions['routes'].first['legs'].first).to have_key('distance')
    expect(directions['routes'].first['legs'].first).to have_key('steps')
  end
end
