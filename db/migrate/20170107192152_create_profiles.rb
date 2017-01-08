class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :names
      t.string :email
      t.string :phone
      t.string :avatar
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end
