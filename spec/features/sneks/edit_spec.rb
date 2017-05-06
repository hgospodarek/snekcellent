require 'rails_helper'

feature 'user edits a snek', %{
  As a user
  I want to edit a  snek
  Because I fucked up when I made it the first time
} do
  # ACCEPTANCE CRITERIA
  # [x] user sees snek info updated and receives notice when updating snek

  scenario 'user edits snek and sees the info updated before their very eyes', :js do
    dood = create(:user)
    snek = create(:snek, user: dood, name: 'Ranger Poodle')
    login_as(dood)
    visit snek_path(snek)

    click_on('Edit Snek')

    fill_in('Name', with: 'Danger Noodle')
    fill_in('Morph', with: 'Yellow')

    click_on('Dat my snek!')

    expect(page).to_not have_content('Ranger Poodle')
    expect(page).to have_content('Danger Noodle')
    expect(page).to have_content('Morph: Yellow')
    expect(page).to have_content("Snek succsessssfully updated")
  end
end
