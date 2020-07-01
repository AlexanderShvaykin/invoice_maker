class CreateBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :bic
      t.string :order
      t.string :bank_order

      t.timestamps
    end
  end
end
