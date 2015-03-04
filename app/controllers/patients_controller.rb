class PatientsController < ApplicationController
    def index
    @patient = current_user.entity.patients.all

    end

    def new
    @patient = current_user.entity.patients.new
    end

    def show
    @patient = current_user.entity.patients.find(params[:id])

    end

    def edit


    end

    def create

    end

    def delete
    end

    def update
        @patient = Patient.find(params[:id])
        @patient.update(patient_params)
        @patient.save
        redirect_to :back
    end

    private

    def patient_params
        params.require(:patient).permit(:name)
    end
end