class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
  default_scope { order(id: :asc) }

end
