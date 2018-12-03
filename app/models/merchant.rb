class Merchant < ApplicationRecord
  has_many  :items
  has_many  :invoices
  has_many :invoice_items, through: :invoices
  has_many  :customers, through: :invoices
  validates_presence_of :name

  def self.most_revenue(quantity)
    Merchant.select(" merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end



end
