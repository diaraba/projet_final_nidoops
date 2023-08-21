class AddConfirmableToStructuresDevise < ActiveRecord::Migration[6.0]
  def up
    add_column :structures, :confirmation_token, :string
    add_column :structures, :confirmed_at, :datetime
    add_column :structures, :confirmation_sent_at, :datetime
    add_column :structures, :unconfirmed_email, :string
    add_index :structures, :confirmation_token, unique: true
    User.update_all confirmed_at: DateTime.now
  end

  def down
    remove_index :structures, :confirmation_token
    remove_columns :structures, :confirmation_token, :confirmed_at, :confirmation_sent_at
    remove_columns :structures, :unconfirmed_email
  end
end
