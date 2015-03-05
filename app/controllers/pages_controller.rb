class PagesController < ApplicationController
    before_action :authenticate_user!, only: :dashboard
  def dashboard
    @entity = current_user.entity
    @patients = current_user.patients

  end

end