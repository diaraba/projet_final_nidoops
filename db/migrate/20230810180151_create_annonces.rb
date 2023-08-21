class CreateAnnonces < ActiveRecord::Migration[6.0]
  def change
    create_table :annonces do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :purpose, null: false, default: ""
      t.references :structure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
