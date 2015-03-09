class PatientsController < ApplicationController
    before_action :access_lvl2?, only: [:create, :edit, :destroy]

    def index
        @patients = current_user.entity.patients
    end

    def new
        if params[:s]
            @medilexicon = Nokogiri::HTML(RestClient.post "http://www.medilexicon.com/drugsearch.php?z=true", {params: {"foo" => "bar"}}).css('#wrapper #level0 #main ul li')
        else
            @medilexicon = []
        end
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

            respond_to do |format|
             if @patient.save
                 format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
                 format.json { render :show, status: :created, location: @patient }
                 else
                    format.html { render :new }
                    format.json { render json: @patient.errors, status: :unprocessable_entity }
                end
            end
        end
    end

    def delete
        @patient.destroy
    end

    def update
        @patient = Patient.find(params[:id])
        # @patient.update(patient_params)
        # @patient.save
        # redirect_to :back
    end

    private

    def patient_params
        params.require(:patient).permit(:name, :age, :gender, :email, :contact, :contact_number, :description,
         :phone_number, medications_attributes: [:name, :description, patient_medications_attributes: [:dose, :count,
            :end_date, :start_date, :frequency]])
    end

end