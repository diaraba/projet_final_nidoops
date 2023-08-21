class CreateProfileUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_users do |t|
      t.string :nom, null: false, default: ""
      t.string :prenom, null: false, default: ""
      t.string :genre, null: false, default: ""
      t.string :situation, null: false, default: ""
      t.string :numero, null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
