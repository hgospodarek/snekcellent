require 'rails_helper'

feature 'user creates a new snek', %{
  As a user
  I want to create a new snek
  So I can track it
} do
  # ACCEPTANCE CRITERIA
  # [x] user is redirected to new snek upon successful creation
  # [x] user must provide name
  # [x] age, sex, species, morph, and adoption date are optional

  scenario 'user successfully creates snek and is brought to snek page', :js do
    dood = create(:user)
    login_as(dood)
    visit sneks_path

    find('#new-snek').click
    expect(page).to have_content('Tell me ’bout your snek')

    fill_in('Name', with: 'Apophis')
    find('label', text: 'Female').click
    fill_in('Species', with: 'Mexican Black Kingsnake')
    fill_in('Age', with: '0')
    fill_in('Morph', with: 'Black')
    fill_in('Adoption Date', with: '08/16/2016')

    click_on('Add snek')

    expect(page).to have_content('Apophis')
    expect(page).to have_content('Sex: Female')
    expect(page).to have_content('Species: Mexican Black Kingsnake')
  end

  scenario 'user must provide name to create a snek', :js  do
    dood = create(:user)
    login_as(dood)
    visit sneks_path

    find('#new-snek').click
    expect(page).to have_content('Tell me ’bout your snek')

    expect(page).to have_selector("input[id='snek_name'][required]")
  end

  scenario 'age, sex, species, morph, and adoption date are optional', :js  do
    dood = create(:user)
    login_as(dood)
    visit sneks_path

    find('#new-snek').click
    expect(page).to have_content('Tell me ’bout your snek')

    fill_in('Name', with: 'Apophis')

    click_on('Add snek')

    expect(page).to have_content('Apophis')
    expect(page).to have_content('Sex: ')
    expect(page).to have_content('Species: ')
  end
end
