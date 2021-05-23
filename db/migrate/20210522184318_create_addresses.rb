class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :complement
      t.string :country, default: 'BR'
      t.string :city, default: 'Rio de Janeiro'
      t.string :state, default: 'RJ'
      t.string :zipcode, null: false
      t.references :register, null: false, foreign_key: true

      t.timestamps
    end
  end
end
