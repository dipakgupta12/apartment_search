FactoryBot.define do
  factory :apartment do
    title { Faker::Lorem.sentence(word_count: 5) }
    price { Faker::Number.number(digits: 3) }
    sqm { Faker::Number.number(digits: 3) }
    number_of_bedrooms { Faker::Number.between(from: 1, to: 5) }
    number_of_bathrooms { Faker::Number.between(from: 1, to: 5) }
    picture { Faker::LoremFlickr.image(size: '100x100', search_terms: ['apartment']) }
  end
end
