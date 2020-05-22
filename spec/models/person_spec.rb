require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validations' do
    subject { build(:person) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:document).only_integer }
    it { is_expected.to validate_presence_of(:birthdate) }
  end
end
