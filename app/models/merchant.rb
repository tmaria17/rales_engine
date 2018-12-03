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

  def self.most_items(quantity)
    Merchant.select("merchants.*, SUM(invoice_items.quantity) as total_items")
    .joins(invoices: [:invoice_items, :transactions])
    .where(transactions: {result: "success"})
    .group(:id)
    .order("total_items desc")
    .limit(quantity)
  end

  def self.revenue(date)
    Merchant.unscoped.select(" merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
   .joins(invoices: [:invoice_items, :transactions])
   .where(transactions: {result: "success"})
   .where(invoices: {created_at: date.to_date.beginning_of_day..date.to_date.end_of_day} )
   .group(:id)
   .order(:id)
  end


  def favorite_customer
    Customer.unscoped
    .select("customers.*, count(invoices.id) AS count")
    .joins(invoices: :transactions)
    .group(:id)
    .where(transactions: {result: "success"})
    .where(invoices: {merchant_id: id})
    .order("count DESC")
    .first
  end

end
