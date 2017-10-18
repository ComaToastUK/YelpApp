require 'rails_helper'

feature 'it has a welcome page' do
  scenario 'a user views the root' do
  visit '/'
  expect(page).to have_content('Welcome')
  end
end

feature 'root has a link to the restaurants page' do
  scenario 'a user clicks the link on the homepage' do
    visit '/'
    click_link 'jelpy'
    expect(page).to have_content 'List of restaurants'
  end
end
