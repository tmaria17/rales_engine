class Api::V1::Customers::SearchController < ApplicationController

  def index
    render json:  CustomerSerializer.new(Customer.where(search_params))
  end

  def show
    render json: CustomerSerializer.new(Customer.find_by(search_params))
  end
  private

    def search_params
      params.permit(:id, :name, :first_name, :created_at, :updated_at)
    end
end
