require 'rails_helper'

RSpec.describe Animal, type: :model do
  context 'default validations' do
    subject { build(:animal) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:monthly_cost).is_greater_than_or_equal_to(0) }
  end

  context 'custom validations' do
    let(:person) { create(:person, :underage) }
    let(:person_with_a) { create(:person, name: 'Alexander, the Greate') }
    let(:animal_kind) { create(:animal_kind, name: 'Andorinha') }
    let(:animal_kind_cat) { create(:animal_kind, name: 'Gato') }
    let(:animal) { build(:animal, owner: person, animal_kind: animal_kind) }
    let(:animal_cat) { build(:animal, owner: person_with_a, animal_kind: animal_kind_cat) }

    it 'is expected to validate animal owner age' do
      animal.validate
      expect(animal.invalid?).to be_truthy
    end

    it 'is expected to validate animal owner name' do
      animal_cat.validate
      expect(animal_cat.invalid?).to be_truthy
    end

    it 'is expected to validate the owner costs' do
      create(:animal, monthly_cost: 1001.00, owner: person)
      new_animal = build(:animal, monthly_cost: 10.00, owner: person)
      
      expect(new_animal.invalid?).to be_truthy
    end
  end
end
