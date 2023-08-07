class AddAliasAndNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :alias, :string
    add_column :users, :name, :string
    add_column :users, :role, :integer, default: 0
  end
end
