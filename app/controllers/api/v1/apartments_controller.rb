class Api::V1::ApartmentsController < ApplicationController
  def index
    if filter_params.empty? || filter_params.keys.all?{ |key| !!valid_filter_params[key] }
      apartments = valid_filter_params.present? ? Apartment.filter(valid_filter_params) : Apartment.all
      render json: apartments, status: :ok
    else
      invalid_keys = (filter_params.keys - valid_filter_params.keys).join(', ')
      message = "Invalid key(s): #{invalid_keys}"
      render json: { message: message }, status: 400
    end
  end

  private

  def filter_params
    params.except('controller', 'action')
  end

  def valid_filter_params
    params.permit(
      :minimum_price,
      :maximum_price,
      :minimum_sqm,
      :maximum_sqm,
      :number_of_bedrooms
    )
  end
end
