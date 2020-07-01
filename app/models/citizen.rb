class Citizen < ApplicationRecord
  belongs_to :user
  has_one :bank
end
