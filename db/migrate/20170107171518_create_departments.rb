class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :status
      t.text :description
      t.references :company, foreign_key: true
      t.string :color

      t.timestamps
    end
  end
end
