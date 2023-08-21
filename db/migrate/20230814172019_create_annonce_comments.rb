class CreateAnnonceComments < ActiveRecord::Migration[6.0]
  def change
    create_table :annonce_comments do |t|
      t.string :description
      t.references :annonce, null: false, foreign_key: true

      t.timestamps
    end
  end
end
