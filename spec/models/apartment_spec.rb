require 'rails_helper'

RSpec.describe Apartment, type: :model do
  subject { create(:apartment) }
  it 'creates valid object' do
    expect(subject).to be_valid
  end
end
