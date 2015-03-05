class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /user/sign_up
  # def new
  #   super
  # end

  # POST /user
  def create
    was_signed_in = current_user

    # devise
    build_resource(sign_up_params)
    user = resource
    user.save
    yield user if block_given?
    if user.persisted?
      if user.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        # respond_with user, location: after_sign_up_path_for(user)
      else
        set_flash_message :notice, :"signed_up_but_#{user.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with user, location: after_inactive_sign_up_path_for(user)
      end
    else
      clean_up_passwords user
      respond_with user
    end
    # end of devise

    user.add_entity(was_signed_in)
    if current_user
      redirect_to root_path
    else
      sign_up(resource_name, user)
      redirect_to new_entity_path
    end
  end






  # GET /user/edit
  # def edit
  #   super
  # end

  # PUT /user
  # def update
  #   super
  # end

  # DELETE /user
  # def destroy
  #   super
  # end

  # GET /user/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(user)
  #   super(user)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(user)
  #   super(user)
  # end
end
