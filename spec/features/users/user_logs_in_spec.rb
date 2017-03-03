require 'rails_helper'

feature 'user signs in', %Q{
  As a user
  I want to log in
  So that I can track my sneks
} do

  # ACCEPTANCE CRITERIA
  # [x] If I specify a valid, previously-registered email and password,
  #     I am authenticated and aI gain access to the system
  # [x] If I specify an invalid email and password, I remain unauthenticated
  # [x] If I am already signed in, I can't sign in again

  scenario 'an existing user provides valid credentials and is signed in' do
    dude = create(:user)

    visit root_path

    fill_in 'Email', with: dude.email
    fill_in 'user_password', with: dude.password
    click_button 'Log in'

    expect(page).to have_content('Ssssalutations')
    expect(page).to have_content('Sign out')
  end

  scenario 'user provides invalid email and password and is denied' do
    visit root_path

    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
    # TODO all of these repeated greetings and things should be variables
    expect(page).to_not have_content('Ssssalutations')
    expect(page).to_not have_content('Sign out')
  end

  scenario 'user provides correct email but incorrect password and is denied' do
    dude = create(:user)
    visit root_path

    fill_in 'Email', with: dude.email
    fill_in 'user_password', with: 'incorrectPassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
    expect(page).to_not have_content('Ssssalutations')
    expect(page).to_not have_content('Sign out')
  end

  scenario 'an already authenticated user cannot re-sign in' do
    dude = create(:user)
    login_as(dude)
    visit root_path

    expect(page).to have_content('Sign out')
    expect(page).to_not have_content('Log in')

    visit new_user_session_path
    expect(page).to have_content('You are already signed in.')
  end
end
