class AddDoseTimeToPatientMedication < ActiveRecord::Migration
  def change
    add_column :patient_medications, :dose_time, :time
  end
end
