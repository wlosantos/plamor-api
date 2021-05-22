class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :name
      t.datetime :contract
      t.string :cpf
      t.string :rg
      t.datetime :birth
      t.integer :plain, default: 0
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
