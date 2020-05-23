require 'rails_helper'

RSpec.describe Animal, type: :model do
  context 'validations' do
    subject { build(:animal) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:monthly_cost).is_greater_than_or_equal_to(0) }
  end
end
