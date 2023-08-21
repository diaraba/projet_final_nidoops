class CreateProfileStructures < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_structures do |t|
      t.string :name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :localisation, null: false, default: ""
      t.string :slogan, null: false, default: ""
      t.string :numero, null: false, default: ""

      t.string :email, null: false, default: ""
      t.references :structure, null: false, foreign_key: true
      t.timestamps
    end
  end
end
