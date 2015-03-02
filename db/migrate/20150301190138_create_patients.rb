class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :entity, index: true
      t.integer :age
      t.string :contact
      t.string :contact_number
      t.text :description
      t.string :email
      t.string :gender
      t.string :name
      t.string :phone_number
      t.string :picture

      t.timestamps null: false
    end
    add_foreign_key :patients, :entities
  end
end
