class Api::V1::Merchants::InvoicesController< ApplicationController

  def index
    # render json: Merchant.find(params[:id]).invoices
    # render json: MerchantSerializer.new(Merchant.find_by(:merchant_id).invoices)
    render json: InvoiceSerializer.new(Invoice.where(merchant_id: params[:id]))
    # binding.pry

  end

end
