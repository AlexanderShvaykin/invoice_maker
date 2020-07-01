class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :invoices, dependent: :destroy
  has_many :organizations, dependent: :destroy
  has_one :citizen
end
