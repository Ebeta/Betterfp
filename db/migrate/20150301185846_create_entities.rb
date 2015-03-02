class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :location
      t.string :name
      t.string :title

      t.timestamps null: false
    end
  end
end
