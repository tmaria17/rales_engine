class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number,
                        :result
  belongs_to :invoice
  default_scope { order(:id)}

end
