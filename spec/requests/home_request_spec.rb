require 'rails_helper'

RSpec.describe 'Home', type: :request do
  context 'visiting the site' do
    subject { get  '/'}
    it do 
      subject
      expect(response).to have_http_status(:ok) 
    
    end
  end
end
