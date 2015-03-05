class PatientMedication < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
  accepts_nested_attributes_for :medication
end
