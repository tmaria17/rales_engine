class Api::V1::Transactions::InvoicesController< ApplicationController

  def show
    render json: InvoiceSerializer.new(Transaction.find(params[:id]).invoice)
    # render json: TransactionSerializer.new(Transaction.find(params[:id]).invoice)

  end

end
