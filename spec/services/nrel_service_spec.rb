require 'rails_helper'


describe 'NREL API makes successful calls' do
  it 'can get nearest station', :vcr do
    service = NRELService.new
    station = service.nearest_station('Hollywood')

    expect(station).to be_a(Hash)
    expect(station).to have_key('fuel_stations')
    expect(station['fuel_stations'].first).to have_key('station_name')
    expect(station['fuel_stations'].first).to have_key('fuel_type_code')
    expect(station['fuel_stations'].first).to have_key('access_days_time')
  end
end
