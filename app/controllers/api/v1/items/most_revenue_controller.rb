class Api::V1::Items::MostRevenueController < ApplicationController

 def index
   item = Item.most_revenue(params[:quantity])
   render json: ItemSerializer.new(item)
 end

end
