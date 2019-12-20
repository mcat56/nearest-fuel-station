require 'rails_helper'


describe 'as a user I can find the nearest charging station' do
  it 'searching from the root page' do
    visit '/'

    select 'Turing', from: :location
    click_on 'Find Nearest Station'

    expect(current_path).to eq('/search')

    expect(page).to have_content('Name: ')
    expect(page).to have_content('Address: ')
    expect(page).to have_content('Fuel Type: ')
    expect(page).to have_content('Access Times: ')
    expect(page).to have_content('Distance to Nearest Station: 0.1 mi')
    expect(page).to have_content('Travel Time: 1 min')
    expect(page).to have_content('Head southeast on 17th St toward Larimer St')

  end
end
