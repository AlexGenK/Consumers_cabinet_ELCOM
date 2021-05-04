# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, :redirect_unless_admin, only: [:new, :create]
  skip_before_action :require_no_authentication

  private

  def redirect_unless_admin
    unless user_signed_in?
      flash[:alert] = "Ця операція доступна тільки зареєстрованим користувачам"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end
end
