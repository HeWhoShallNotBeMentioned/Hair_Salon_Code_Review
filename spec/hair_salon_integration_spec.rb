require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients fot it') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('stylist_name', :with => 'Vidal Sasson')
    click_button('Add New Stylist')
    expect(page).to have_content('Success!')
  end
end
