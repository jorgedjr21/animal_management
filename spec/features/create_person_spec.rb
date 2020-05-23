require 'rails_helper'

RSpec.feature 'Create Person Feature', type: :feature do
  context 'from home' do
    context 'filling form correctly' do
      it 'must create the new user' do
        visit '/'
        click_link 'Pessoas'
        click_link 'Adicionar pessoa'

        fill_in 'person_name', with: 'Joao Carlos'
        fill_in 'person_document', with: '555666555'
        fill_in 'person_birthdate', with: '10/01/2010'
        click_button 'Salvar'

        expect(page).to have_content('Operação realizada com sucesso!')
        expect(page).to have_current_path(people_path)
        expect(Person.count).to eq(1)
      end
    end

    context 'filling form with mistakes' do
      it 'must not create the new user' do
        visit '/'
        click_link 'Pessoas'
        click_link 'Adicionar pessoa'

        fill_in 'person_name', with: 'Joao Carlos'
        fill_in 'person_document', with: 'teste'
        fill_in 'person_birthdate', with: '10/01/2010'
        click_button 'Salvar'

        expect(page).to have_content('Documento deve conter somente numeros')
        expect(page).to have_current_path(people_path)
        expect(Person.count).to eq(0)
      end
    end
  end
end
