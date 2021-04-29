require 'rails_helper'

RSpec.describe Apartment, type: :model do
  subject { create(:apartment) }
  it 'creates valid object' do
    expect(subject).to be_valid
  end

  context '#filter' do
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
    it do
      params = {
                  minimum_price: '4000',
                  maximum_price: '6000',
                  minimum_sqm: '500',
                  maximum_sqm: '900',
                  number_of_bedrooms: '5'
                }
      expect(Apartment.filter(params)).to eq [apartment1]
      expect(Apartment.filter(params)).not_to eq [apartment2]
    end
  end
end
