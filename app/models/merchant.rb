class Merchant < ApplicationRecord
  has_many  :items
  has_many  :invoices
  has_many :invoice_items, through: :invoices
  has_many  :customers, through: :invoices
  validates_presence_of :name
  
  def self.most_revenue(quantity)
    Merchant.joins(invoice_items: [:transactions])
    .where(transactions: {result: "success"})
    .select("sum(invoice_items.quantity * invoice_items.unit_prices) AS revenue, merchants.*")
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end
end
