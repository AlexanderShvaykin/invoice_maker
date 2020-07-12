class AddBankToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :bank, foreign_key: true
  end
end
