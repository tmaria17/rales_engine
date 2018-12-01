class Api::V1::InvoiceItems::SearchController < ApplicationController

  def index
    render json:  InvoiceItemSerializer.new(InvoiceItem.where(search_params))
  end

  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(search_params))
  end
  private

    def search_params
      params.permit(:id, :quantity, :unit_price, :transaction_id, :invoice_id,
                    :item_id, :created_at, :updated_at)
    end
end
