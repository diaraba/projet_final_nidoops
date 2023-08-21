class AddActivitesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :activites_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :activite, null: false, foreign_key: true
    end
  end
end
