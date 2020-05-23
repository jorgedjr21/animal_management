require 'rails_helper'

RSpec.describe Animal, type: :model do
  context 'default validations' do
    subject { build(:animal) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:monthly_cost).is_greater_than_or_equal_to(0) }
  end

  context 'custom validations' do
    let(:person) { create(:person, :underage) }
    let(:animal_kind) { create(:animal_kind, name: 'Andorinha') }
    let(:animal) { build(:animal, owner: person, animal_kind: animal_kind)}

    it 'is expected to validate animal owner' do
      animal.validate
      expect(animal.invalid?).to be_truthy
    end
  end
end
