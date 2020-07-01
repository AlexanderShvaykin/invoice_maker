class RenameOrderToInvoice < ActiveRecord::Migration[6.0]
  def change
    rename_table :orders, :invoices
  end
end
