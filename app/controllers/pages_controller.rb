class PagesController < ApplicationController
    before_action :authenticate_user!, only: :dashboard
  def dashboard
    @entity = current_user.entity
    @patient = @entity.patients.new

  end

end