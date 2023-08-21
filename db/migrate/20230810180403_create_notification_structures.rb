class CreateNotificationStructures < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_structures do |t|
      t.string :title, null: false, default: ""
      t.boolean :statut, null: false, default: false
      t.string :description, null: false, default: ""
      t.references :structure, null: false, foreign_key: true
      t.references :annonce, null: false, foreign_key: true
      t.references :avis_offre, null: false, foreign_key: true


      t.timestamps
    end
  end
end
