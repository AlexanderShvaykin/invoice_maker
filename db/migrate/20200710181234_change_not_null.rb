class ChangeNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :organizations, :bank_id, true
  end
end
