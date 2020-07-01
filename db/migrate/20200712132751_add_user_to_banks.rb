class AddUserToBanks < ActiveRecord::Migration[6.0]
  def change
    add_reference :banks, :citizen, foreign_key: true
  end
end
