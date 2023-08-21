class CreateAvisOffreComments < ActiveRecord::Migration[6.0]
  def change
    create_table :avis_offre_comments do |t|
      t.string :description
      t.references :avis_offre, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
