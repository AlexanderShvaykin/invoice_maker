class Invoice < ApplicationRecord
  belongs_to :organization
  belongs_to :bank
  belongs_to :user
  has_one :citizen, through: :user
  has_many :items, :class_name => 'Invoices::Item'

  accepts_nested_attributes_for :items
end
