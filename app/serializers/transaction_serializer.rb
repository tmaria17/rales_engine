class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :invoice_id,
             :result,
             :credit_card_number
end
