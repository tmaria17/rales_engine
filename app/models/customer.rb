class Customer < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices
  default_scope { order(:id)}

  def favorite_merchant
    merchants.select("merchants.*, count(transactions.id) as count")
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order("count DESC")
    .first
  end

end
