class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
