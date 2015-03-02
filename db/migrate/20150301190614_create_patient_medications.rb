class CreatePatientMedications < ActiveRecord::Migration
  def change
    create_table :patient_medications do |t|
      t.references :patient, index: true
      t.references :medication, index: true
      t.string :dose
      t.integer :count
      t.date :start_date
      t.date :end_date
      t.string :frequency
      t.boolean :taken

      t.timestamps null: false
    end
    add_foreign_key :patient_medications, :patients
    add_foreign_key :patient_medications, :medications
  end
end
