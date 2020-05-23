require 'rails_helper'

RSpec.feature "List Person Animals Feature", type: :feature do
  let!(:person) { create(:person) }
  let!(:animal_kind) { create(:animal_kind, name: 'Cachorro') }
  let!(:animals) do
    create(:animal, name: 'Some name', monthly_cost: 70.11, animal_kind: animal_kind, owner: person )
    create(:animal, name: 'Some name', monthly_cost: 70.11, animal_kind: animal_kind, owner: person )
    create(:animal, name: 'Some name', monthly_cost: 70.11, animal_kind: animal_kind, owner: person )
  end

  context 'showing animals list from person' do
    context 'filling the form correctly' do
      it 'must create the add the new animal' do
        visit '/'
        click_link 'Pessoas'
        find("#new_animal_#{person.id}").click


        expect(page).to have_content('R$ 210,33')
        expect(page).to have_content('Animais: 3')
      end
    end
  end
end
