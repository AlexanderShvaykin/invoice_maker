class Organization < ApplicationRecord
  belongs_to :user
  has_many :invoices, dependent: :destroy
end
