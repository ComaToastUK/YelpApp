require 'rails_helper'



feature 'it has a welcome page' do
  scenario 'a user views the root' do
  # sign_up
  visit '/'
  expect(page).to have_content('Welcome')
  end
end

feature 'root has a link to the restaurants page' do
  scenario 'a user clicks the link on the homepage' do
    # sign_up
    visit '/'
    click_link 'Jelpy'
    expect(page).to have_content 'List of restaurants'
  end
end

feature 'it has a list of restaurants' do
  scenario 'a user wants to see the list of restaurants' do
    # sign_up
    name = 'Cheeseland'
    location = 'Camembert'
    description = "We're really Fond-of-Ue"
    visit '/restaurants/new'
    fill_in "restaurant[name]", with: name
    fill_in 'restaurant[location]', with: location
    fill_in 'restaurant[description]', with: description
    submit_form
    expect(page).to have_content 'Cheeseland'
  end
end

feature 'shows an individual restaurant' do
  scenario 'a user can view Cheeselands description' do
    # sign_up
    create_restaurant
    visit '/restaurants'
    click_link 'Show'
    expect(page).to have_content "We're really Fond-of-Ue"
  end
end

feature 'can leave a comment on a restaurant' do
  scenario 'a user wants to leave a comment on their experience at Cheeseland' do
    # sign_up
    create_restaurant
    visit '/restaurants'
    click_link 'Show'
    fill_in 'comment[commenter]', with: 'Cheesy Pete'
    fill_in 'comment[body]', with: 'The food was sweet'
    submit_form
    expect(page).to have_content 'Cheesy Pete'
  end
end

feature 'can delete comments from the page' do
  scenario 'a user wants to delete the rude comment they wrote' do
    # sign_up
    create_restaurant
    visit '/restaurants'
    click_link 'Show'
    fill_in 'comment[commenter]', with: 'Cheesy Pete'
    fill_in 'comment[body]', with: 'The food was rancid'
    submit_form
    click_link 'Destroy'
    expect(page).not_to have_content 'Cheesy Pete'
  end
end

def submit_form
   find('input[name="commit"]').click
end

def restaurant_params
  params.require(:restaurant).permit(:name, :location, :description)
end

def create_restaurant
  name = 'Cheeseland'
  location = 'Camembert'
  description = "We're really Fond-of-Ue"
  visit '/restaurants/new'
  fill_in "restaurant[name]", with: name
  fill_in 'restaurant[location]', with: location
  fill_in 'restaurant[description]', with: description
  submit_form
end

# def sign_up
#   user = User.create email: 'test@testmail.com', password: '12345678', password_confirmation: '12345678'
#   login_as user
# end
