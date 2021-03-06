require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'urser', 'usersba.com') }

  it { should have_many(:sneks).dependent(:destroy) }

  it 'needs a matching password confirmation for the password' do
    user = User.new
    user.password_confirmation = 'another password'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
