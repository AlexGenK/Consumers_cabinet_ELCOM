class UsersController < ApplicationController

	def index
    @users = User.order(:name)
  end

  private

  def user_params
    params.require(:user).permit(:admin_role, :manager_role, :client_role, :name, :email)
  end
end
