require 'rails_helper'

RSpec.feature 'Update Person Info', type: :feature do
  context 'when the person doesn\'t exists' do
    it 'must redirect to people_path' do
      visit '/people/1/edit'

      expect(page).to have_content('Não foi possivel encontrar informações para prosseguir.')
      expect(page).to have_current_path(people_path)
    end
  end
  describe 'when the person exists' do
    let!(:person) { create(:person) }

    context 'with invalid attributes' do
      it 'must not update the person info' do
        visit '/'
        click_link 'Pessoas'
        find('#edit_person').click

        fill_in 'person_name', with: 'Joao Carlos'
        fill_in 'person_document', with: 'teste'
        fill_in 'person_birthdate', with: '10/01/1991'
        click_button 'Salvar'

        expect(person.reload.name).not_to eq('Joao Carlos')
        expect(person.reload.document).not_to eq(555_666_555)
        expect(person.reload.birthdate.strftime('%d/%m/%Y')).not_to eq('10/01/2010')
      end

      it 'must show the error message and keep in the edit page' do
        visit '/'
        click_link 'Pessoas'
        find('#edit_person').click

        fill_in 'person_name', with: 'Joao Carlos'
        fill_in 'person_document', with: 'teste'
        fill_in 'person_birthdate', with: '10/01/1991'
        click_button 'Salvar'

        expect(page).to have_content('Documento deve conter somente numeros')
        expect(page).to have_current_path(person_path(person))
      end
    end

    context 'with valid attributes' do
      it 'must update the person info' do
        visit '/'
        click_link 'Pessoas'
        find('#edit_person').click

        fill_in 'person_name', with: 'Joao Carlos'
        fill_in 'person_document', with: '555666555'
        fill_in 'person_birthdate', with: '10/01/2010'
        click_button 'Salvar'

        
        expect(person.reload.name).to eq('Joao Carlos')
        expect(person.reload.document).to eq(555666555)
        expect(person.reload.birthdate.strftime('%d/%m/%Y')).to eq('10/01/2010')
      end

      it 'must show success message and redirect' do
        visit '/'
        click_link 'Pessoas'
        find('#edit_person').click

        fill_in 'person_name', with: 'Joao Carlos'
        fill_in 'person_document', with: '555666555'
        fill_in 'person_birthdate', with: '10/01/2010'
        click_button 'Salvar'

        expect(page).to have_content('Operação realizada com sucesso!')
        expect(page).to have_current_path(people_path)
      end
    end
  end
end
