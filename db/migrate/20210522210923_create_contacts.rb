class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.integer :kind, default: 0
      t.string :description
      t.references :register, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
