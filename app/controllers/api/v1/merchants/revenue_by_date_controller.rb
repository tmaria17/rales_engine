class Api::V1::Merchants::RevenueByDateController < ApplicationController

 def index
   render json: MerchantSerializer.new(Merchant.revenue(params[:date]))
 end

end
