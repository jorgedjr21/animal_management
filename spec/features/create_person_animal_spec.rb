require 'rails_helper'

RSpec.feature "Create Person Animal Feature", type: :feature do
  let!(:person) { create(:person) }
  let!(:animal_kind) { create(:animal_kind, name: 'Cachorro') }

  context 'from home' do
    context 'filling the form correctly' do
      it 'must create the add the new animal' do
        visit '/'
        click_link 'Pessoas'
        find('#new_animal').click
        click_link 'Adicionar animal'

        fill_in 'animal_name', with: 'Joao Carlos'
        fill_in 'animal_monthly_cost', with: '55.00'
        find('#animal_animal_kind_id').find("option[value=#{animal_kind.id}]").select_option
        click_button 'Salvar'

        expect(page).to have_content('Operação realizada com sucesso!')
        expect(page).to have_current_path(person_animals_path(person))
        expect(Animal.count).to eq(1)
      end
    end

    context 'filling form with mistakes' do
      it 'must not create the new animal' do
        visit '/'
        click_link 'Pessoas'
        find('#new_animal').click
        click_link 'Adicionar animal'

        fill_in 'animal_name', with: ''
        fill_in 'animal_monthly_cost', with: '55.00'
        find('#animal_animal_kind_id').find("option[value=#{animal_kind.id}]").select_option
        click_button 'Salvar'

        expect(page).to have_content('Nome não pode ficar em branco')
        expect(page).to have_current_path(person_animals_path(person))
        expect(Animal.count).to eq(0)
      end
    end
  end
end
