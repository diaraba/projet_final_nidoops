class CreateUtilisateurs < ActiveRecord::Migration[6.0]
  def change
    create_table :utilisateurs do |t|

      t.timestamps
    end
  end
end
