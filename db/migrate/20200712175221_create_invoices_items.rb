class CreateInvoicesItems < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :name
      t.integer :count
      t.integer :price

      t.timestamps
    end
  end
end
