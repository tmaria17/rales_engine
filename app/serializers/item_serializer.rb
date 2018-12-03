class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :merchant_id, :id

  attribute :unit_price do |object|
    "%.2f" % (object.unit_price.to_f / 100)
  end


end
