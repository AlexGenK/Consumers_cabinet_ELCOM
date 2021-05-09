class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy, :edit]
  load_and_authorize_resource

  def index
    @users = User.order(:name)
  end

  def destroy
    if (@user.admin_role?) && (User.where(admin_role: true).count <= 1)
      flash[:alert] = 'Неможливо видалити останнього адміністратора'
    else
      @user.destroy ? flash[:notice] = 'Користувач був успішно видалений' : flash[:alert] = 'Неможливо видалити цього користувача'
    end
    redirect_to users_path
  end

  def edit
  end

  def update
    if (@user.admin_role?) && (User.where(admin_role: true).count <= 1) && (user_params[:admin_role] == "0")
      flash[:alert] = 'Неможливо видалити останнього адміністратора'
      redirect_to users_path
    else
      if @user.update(user_params)
        flash[:notice] = "Користувач #{@user.name} був успішно відредагований" 
        redirect_to users_path
      else
        flash[:alert] = 'Неможливо відредагувати користувача'
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin_role, :manager_role, :client_role, :name, :email)
  end
end
