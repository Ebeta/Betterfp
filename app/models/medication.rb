class Medication < ActiveRecord::Base
	has_many :patient_medications
end
