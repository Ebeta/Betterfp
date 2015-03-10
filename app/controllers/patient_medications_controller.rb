class PatientMedicationsController < InheritedResources::Base
    def update
     @patient_medication = PatientMedication.find(params[:id])
        @patient_medication.update(patient_medication_params)
        @patient_medication.save
        redirect_to :back
    end

    def create
        PatientMedication.create(patient_medication_params)
        redirect_to :back
    end

    def edit
    end

    def destroy
    end

    private
    def patient_medication_params
        params.require(:patient_medication).permit(:dose_time, :medication_id, :patient_id)
    end
end