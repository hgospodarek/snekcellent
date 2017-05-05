require 'rails_helper'

feature 'user deletes a snek', %{
  As a user
  I want to delete a  snek
  Because I don't even know why
} do
  # ACCEPTANCE CRITERIA
  # [x] user is redirected to sneks index upon successful deletion
  # [x] user must confirm snek deletion

  scenario 'user deletes snek and confirms; snek is deleted and user lands on sneks index', :js do
    dood = create(:user)
    snek = create(:snek, user: dood)
    login_as(dood)
    visit snek_path(snek)

    accept_confirm { click_on('Remove Snek') }

    expect(page).to have_content("Your Sneks")
    expect(page).to have_content("Removed :(")
    expect(page).to_not have_content(snek.name)
  end

  scenario 'user does not confirm snek deletion and snek is not deleted', :js do
    dood = create(:user)
    snek = create(:snek, user: dood)
    login_as(dood)
    visit snek_path(snek)

    dismiss_confirm { click_on('Remove Snek') }

    expect(page).to_not have_content("Your Sneks")
    expect(page).to_not have_content("Removed :(")
    expect(page).to have_content(snek.name)
  end
end
