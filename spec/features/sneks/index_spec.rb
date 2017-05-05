require 'rails_helper'

feature 'user views the sneks index', %{
  As a user
  I want to see a list of all my sneks
  Because I have sneks
} do

  # ACCEPTANCE CRITERIA
  # [x] User with no sneks still sees add snek button
  # [x] All user sneks are listed in by name
  # [x] User cannot see other users' sneks

  scenario 'user with no sneks still sees add snek button', :js do
    dood = create(:user)

    login_as(dood)
    visit sneks_path

    expect(page).to have_content('You have no sneks!')
    expect(page).to have_content('+1 Snek!')
  end

  scenario 'user sees sneks listed in alphabetical order by name' do
    dood = create(:user)
    b_snek = create(:snek, name: 'Tiamat', user: dood)
    a_snek = create(:snek, name: 'Apophis', user: dood)

    login_as(dood)
    visit sneks_path

    expect(a_snek.name).to appear_before(b_snek.name)
  end

  scenario 'user cannot see other users’ sneks' do
    dood = create(:user)
    my_snek = create(:snek, name: 'Apophis', user: dood)

    other_dood = create(:user)
    not_my_snek = create(:snek, name: 'Tiamat', user: other_dood)

    login_as(dood)
    visit sneks_path

    expect(page).to have_content(my_snek.name)
    expect(page).to_not have_content(not_my_snek.name)
  end
end
