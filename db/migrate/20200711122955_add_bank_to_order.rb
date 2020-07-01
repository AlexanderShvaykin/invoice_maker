class AddBankToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :bank, foreign_key: true
  end
end
