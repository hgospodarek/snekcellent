require 'rails_helper'

RSpec.describe Snek, type: :model do
  it { should belong_to :user }
  it { should validate_presence_of :user }

  it { should validate_presence_of(:name) }
  it { should have_valid(:name).when('Plissken') }
  it { should_not have_valid(:name).when('', nil) }

  it {
    should validate_numericality_of(:age)
    .only_integer
    .is_greater_than_or_equal_to(0)
    .allow_nil
  }

  it {
    should validate_inclusion_of(:sex)
    .in_array(['Male', 'Female'])
    .allow_blank
  }
end
