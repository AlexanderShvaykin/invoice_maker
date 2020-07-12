class AddNotNulltoOrder < ActiveRecord::Migration[6.0]
  def change
    change_column_null :orders, :bank_id, false
    remove_column :organizations, :bank_id
  end
end
