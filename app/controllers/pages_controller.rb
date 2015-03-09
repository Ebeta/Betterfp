class PagesController < ApplicationController
    before_action :authenticate_user!, only: :dashboard
  def dashboard
    @entity = current_user.entity
    @patients = current_user.patients
    @patient_medications = PatientMedication.where(patient_id: current_user.patients).order(:dose_time)
  end

end