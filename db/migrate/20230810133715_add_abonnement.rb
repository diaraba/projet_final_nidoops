class AddAbonnement < ActiveRecord::Migration[6.0]
  def change
    create_table :abonnements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :structure, null: false, foreign_key: true
    end
  end
end
