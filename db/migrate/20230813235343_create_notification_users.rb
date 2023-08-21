class CreateNotificationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :notification_users do |t|
      t.string :title, null: false, default: ""
      t.boolean :statut, null: false, default: false
      t.string :description, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
