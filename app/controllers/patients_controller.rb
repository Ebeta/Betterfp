class PatientsController < ApplicationController
    before_action :access_lvl2?, only: [:create, :edit, :destroy]

    def index
        @patients = current_user.entity.patients
    end

    def new
        @patient = current_user.entity.patients.new
        pm = @patient.patient_medications.build
        pm.build_medication
    end

    def show
        @patient = current_user.entity.patients.find(params[:id])
    end

    def edit
    end

    def create
        @patient = current_user.entity.patients.create(patient_params)
        if @patient.save
            redirect_to @patient
        else
            render :action => 'new'
        # PatientMedication.create(patient: patient, medication: med)
    end
    end

    def delete
        @patient.destroy
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update(patient_params)
        @patient.save
        redirect_to :back
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :age, :gender, :email, :contact, :contact_number, :description,
         :phone_number, patient_medications_attributes: [:dose, :count, :end_date, :start_date,
            :frequency, medication_attributes: [:name, :description]])
    end

end