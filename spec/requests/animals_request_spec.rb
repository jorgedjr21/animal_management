require 'rails_helper'

RSpec.describe 'Animals Requests', type: :request do
  let!(:person) { create(:person) }
  let(:animal_kind) { create(:animal_kind, name: 'Cachorro') }

  describe 'GET /people/:person_id/animals' do
    context 'when person exists' do
      it 'must have http status 200' do
        get "/people/#{person.id}/animals"

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when person doesn\'t exists' do
      it 'must redirect to people_path' do
        get '/people/9999/animals'

        expect(response).to redirect_to(people_path)
      end
    end
  end

  describe 'GET /people/:person_id/animals' do
    context 'when person exists' do
      it 'must instanciate the new animal' do
        get "/people/#{person.id}/animals/new"

        expect(assigns[:animal].to_json).to eq(Animal.new(person_id: person.id).to_json)
      end
    end

    context 'when person doesn\'t exists' do
      it 'must redirect to people_path' do
        get '/people/9999/animals/new'

        expect(response).to redirect_to(people_path)
      end
    end
  end

  describe 'POST /people/:person_id/animals' do
    context 'when person exists' do
      context 'with valid params' do
        let(:valid_params) do
          {
            animal: {
              name: 'Pirula',
              monthly_cost: '70.00',
              animal_kind_id: animal_kind.id
            }
          }
        end

        it 'must save the new animal' do
          expect { post "/people/#{person.id}/animals", params: valid_params }.to change(Animal, :count).by(1)
        end

        it 'must save the correct animal owner' do
          post "/people/#{person.id}/animals", params: valid_params
          expect(Animal.last.owner).to eq(person)
        end

        context 'when person has less than 18 years' do
          let!(:underage_person) { create(:person, birthdate: Date.today - 10.years) }
          let(:andorinha) { create(:animal_kind, name: 'Andorinha') }
  
          it 'must not add the \'Andorinha\' animal' do
            valid_params[:animal][:animal_kind_id] = andorinha.id

            expect { post "/people/#{underage_person.id}/animals", params: valid_params }.not_to change(Animal, :count)
          end
        end
      end

      context 'with invalid params' do
        let(:invalid_params) do
          {
            animal: {
              name: 'Pirula',
              monthly_cost: 'teste',
              animal_kind_id: animal_kind.id
            }
          }
        end

        it 'must not save the animal' do
          expect { post "/people/#{person.id}/animals", params: invalid_params }.not_to change(Animal, :count)
        end
      end
    end
  end
end
