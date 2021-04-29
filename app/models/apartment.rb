class Apartment < ApplicationRecord
  def self.filter(params)
    apartments = Apartment.where(
      price: (params[:minimum_price]..params[:maximum_price]),
      sqm: (params[:minimum_sqm]..params[:maximum_sqm])
    )
    apartments = apartments.where(
      number_of_bedrooms: params[:number_of_bedrooms]
    ) if params[:number_of_bedrooms].present?
    apartments
  end
end
