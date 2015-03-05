class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception

before_action :set_language

protected
  def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_registration_path, :notice => 'if you want to add a notice'
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

def access_lvl1?
  unless current_user.access >= 1
    redirect_to root_path
  end
end

def access_lvl2?
  unless current_user.access >= 2
    redirect_to root_path
  end
end

def access_lvl3?
  unless current_user.access >= 3
    redirect_to root_path
  end
end

def is_admin?
  unless current_user.admin
    redirect_to root_path
  end
end

  def has_entity?
  	if current_user.entity
  		redirect_to root_path
  	end
  end
end



