class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :invoice_id,
             :id,
             :result,
             :credit_card_number
end
