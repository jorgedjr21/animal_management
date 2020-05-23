require 'rails_helper'

RSpec.describe "People", type: :request do

  describe 'PUT /people/:id' do
    let(:person) { create(:person) }

    context 'when person doesn\'t exists' do
      it 'must redirect to people_path' do
        put '/people/999', params: {}

        expect(response).to redirect_to(people_path)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_params) do
        {
          person: {
            name: 'New Name',
            document: 555_777_555,
            birthdate: 'teste'
          }
        }
      end

      it 'must not update the person infos' do
        put "/people/#{person.id}", params: invalid_params

        expect(person.reload.name).not_to eq('New name')
        expect(person.reload.document).not_to eq(555_777_555)
      end
    end

    context 'with valid attributes' do
      let(:valid_params) do
        {
          person: {
            name: 'New Name',
            document: 555_777_555,
            birthdate: '19/01/1991'
          }
        }
      end

      it 'must update the person infos' do
        put "/people/#{person.id}", params: valid_params

        expect(person.reload.name).to eq('New Name')
        expect(person.reload.document).to eq(555_777_555)
        expect(person.reload.birthdate.strftime('%d/%m/%Y')).to eq('19/01/1991')
      end
    end
  end

  describe 'POST /people' do
    context 'with valid attributes' do
      let(:valid_params) do
        {
          person: {
            name: 'Name',
            document: 555_666_555,
            birthdate: '19/01/2000'
          }
        }
      end

      subject { post '/people', params: valid_params }

      it { expect { subject }.to change(Person, :count).by(1) }
      it 'have correct name' do
        subject
        expect(Person.last.name).to eq('Name')
      end

      it 'have correct document' do
        subject
        expect(Person.last.document).to eq(555_666_555)
      end

      it 'have correct birthdate' do
        subject
        expect(Person.last.birthdate.strftime('%d/%m/%Y')).to eq('19/01/2000')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          person: {
            name: '',
            document: 'teste',
            birthdate: ''
          }
        }
      end

      subject { post '/people', params: invalid_params }

      it { expect { subject }.not_to change(Person, :count) }
    end
  end

  describe 'DELETE /people/:id' do
    context 'when person exists' do
      let!(:person) { create(:person, :with_animal) }
      
      it 'must destroy the person' do
        expect { delete "/people/#{person.id}", params: {} }.to change(Person, :count).by(-1)
      end

      it 'must destroy the person animal' do
        expect { delete "/people/#{person.id}", params: {} }.to change(Animal, :count).by(-1)
      end
    end

    context 'when person doesn\'t exists' do
      it 'must not destroy the person' do
        
        expect { delete '/people/19', params: {} }.not_to change(Person, :count)
      end

      it 'must redirect to people_path' do
        delete "/people/19", params: {}

        expect(response).to redirect_to(people_path)
      end
    end
  end
end
