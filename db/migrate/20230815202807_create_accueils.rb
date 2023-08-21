class CreateAccueils < ActiveRecord::Migration[6.0]
  def change
    create_table :accueils do |t|

      t.timestamps
    end
  end
end
