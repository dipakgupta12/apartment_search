require 'rails_helper'

RSpec.describe 'Api::V1::Apartments', type: :request do
  describe 'GET /index' do
    context 'with out filters' do
      let!(:apartments) { FactoryBot.create_list(:apartment, 5) }
      it 'returns all apartments' do
        get '/api/v1/apartments'

        expect(json.size).to eq(5)
      end
    end

    context 'with invalid filters' do
      it 'gives error' do
        get '/api/v1/apartments', params: { number_of_bathrooms: '2' }
        expect(response.code).to eq '400'
        expect(json['message']).to eq 'Invalid key(s): number_of_bathrooms'
      end
    end

    context 'with valid filters' do
      let!(:apartment1) {
        FactoryBot.create(:apartment,
                          price: 5000,
                          sqm: 800,
                          number_of_bedrooms: 5,
                          number_of_bathrooms: 5)
      }

      let!(:apartment2) {
        FactoryBot.create(:apartment,
                          price: 3000,
                          sqm: 500,
                          number_of_bedrooms: 3,
                          number_of_bathrooms: 3)
      }

      let!(:apartment3) {
        FactoryBot.create(:apartment,
                          price: 1000,
                          sqm: 300,
                          number_of_bedrooms: 1,
                          number_of_bathrooms: 1)
      }

      it 'filters by minimum_price' do
        get '/api/v1/apartments', params: { minimum_price: '2500' }
        expect(json.pluck('id')).to eq [apartment1.id, apartment2.id]
      end

      it 'filters by maximum_price' do
        get '/api/v1/apartments', params: { maximum_price: '4000' }
        expect(json.pluck('id')).to eq [apartment2.id, apartment3.id]
      end

      it 'filters by minimum_sqm' do
        get '/api/v1/apartments', params: { minimum_sqm: '300' }
        expect(json.pluck('id')).to eq [apartment1.id, apartment2.id, apartment3.id]
      end

      it 'filters by maximum_sqm' do
        get '/api/v1/apartments', params: { maximum_sqm: '500' }
        expect(json.pluck('id')).to eq [apartment2.id, apartment3.id]
      end

      it 'filters by number_of_bedrooms' do
        get '/api/v1/apartments', params: { number_of_bedrooms: '3' }
        expect(json.pluck('id')).to eq [apartment2.id]
      end

      it 'filters by minimum_price, maximum_price, minimum_sqm, maximum_sqm, number_of_bedrooms' do
        get '/api/v1/apartments', params: {
                                            minimum_price: '1000',
                                            maximum_price: '2000',
                                            minimum_sqm: '100',
                                            maximum_sqm: '500',
                                            number_of_bedrooms: '1'
                                          }
        expect(json.pluck('id')).to eq [apartment3.id]
      end
    end
  end
end
