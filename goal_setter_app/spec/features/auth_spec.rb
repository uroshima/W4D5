require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  before(:each) do
    visit new_user_url
  end
  
  scenario 'has a new user page' do
    expect(page).to have_content 'New User'
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      fill_in 'username', with: 'ronweasley'
      fill_in 'password', with: '123456'
      click_on 'Create User' 
      expect(page).to have_content 'ronweasley'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
     
    user = User.create(username: "ronweasley", password: "123456")
    fill_in 'username', with: 'ronweasley'
    fill_in 'password', with: '123456'
    click_on 'Log In' 
    expect(page).to have_content 'ronweasley'
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    
    expect(page).to_not have_content 'Log Out' #new user
  end
  

  scenario 'doesn\'t show username on the homepage after logout' do
    #signed in --> click on log out button --> expect
    visit new_session_url
    expect(page).to_not have_content('ronweasley')
  end

end