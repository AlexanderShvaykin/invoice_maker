class CreateCitizens < ActiveRecord::Migration[6.0]
  def change
    create_table :citizens do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :last_name
      t.string :middle_name
      t.string :inn
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
