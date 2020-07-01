class AddUserToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :user, foreign_key: true
    remove_column :users, :organization_id
  end
end
