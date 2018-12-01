class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :item_id, :invoice_id, :quantity, :id
  attribute :unit_price do |object|
    "%.2f" % (object.unit_price.to_f / 100)
  end
end
