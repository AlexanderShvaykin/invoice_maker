class Invoices::Item < ApplicationRecord
  belongs_to :invoice
end
