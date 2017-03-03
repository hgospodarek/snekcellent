require 'rails_helper'

feature 'Sign up', %(
  As an unauthenticated user
  I want to Sign up
  So I can track my sneks.
) do

  # ACCEPTANCE CRITERIA
  # [x] I must specify a valid email address
  # [x] I must specify a password, and confirm that password
  # [x] If I do the above, I am registered and authenticated
  # [x] If I do not do the above, I get an error message

  scenario 'user provides valid required information and is created' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('Ssssalutations, new user.')
    expect(page).to have_content('Sign out')
  end

  scenario 'user receives error if any required information is missing' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign out')
  end

  scenario 'user receives error if password confirmation does not match' do
    visit root_path
    click_link 'Sign up'

    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'somethingDifferent'
    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign out')
  end
end
