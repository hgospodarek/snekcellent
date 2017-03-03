require 'rails_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that other users can't pretend to be me
} do
  # ACCEPTANCE CRITERIA
  # [x] I must be signed in to sign out
  # [x] I receive a message when I sign out

  scenario 'an authenticated user signs out' do
    dude = create(:user)
    login_as(dude)
    visit root_path

    click_link 'Sign out'

    expect(page).to have_content('Log in')
    expect(page).to_not have_content('Sign out')
  end

  scenario 'an unathenticated user cannot sign out' do
    visit root_path

    expect(page).to have_content('Sign up')
    expect(page).to have_content('Log in')
    expect(page).to_not have_content('Sign out')
  end
end
