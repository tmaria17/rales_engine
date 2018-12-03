class Api::V1::Items::SearchController < ApplicationController

  def index
    render json:  ItemSerializer.new(Item.where(search_params))
  end

  def show
    render json: ItemSerializer.new(Item.find_by(search_params))
  end
  private

    def search_params
      params[:unit_price] = params[:unit_price].delete('.').to_i if params[:unit_price]

      params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
    end
end
