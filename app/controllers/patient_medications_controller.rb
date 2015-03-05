class PatientMedicationsController < InheritedResources::Base
    def update
     @patient_medication = Patient_medication.find(params[:id])
        @patient_medication.update(patient_medication_params)
        @patient_medication.save
        redirect_to :back
    end

    private
    def patient_medication_params
        params.require(:patient_medication).permit(:name)
    end



end