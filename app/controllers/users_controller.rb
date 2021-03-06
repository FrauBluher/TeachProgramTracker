class UsersController < ApplicationController
  def index
    @locations = ResidencyLocation.all

    if current_user.admin?
      @users = User.order("trainer DESC")
    elsif current_user.trainer?
      @users = User.where(admin: false, trainer: false, residency_location_id: current_user.residency_location_id)
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @location = ResidencyLocation.find_by(id: @user.residency_location_id)
    @procedures = Procedure.where user_id: @user.id

    unless current_user_has_access_to_user(@user)
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
    redirect_to root_path unless current_user_has_access_to_user(@user)
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      flash[:error] = @user.errors.messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if current_user_has_access_to_user(user)
      user.destroy
      redirect_to users_path
    else
      redirect_to root_path
    end
  end

  def invite
    if User.find_by(email: user_params[:email]).nil?
      User.invite!(
        email: user_params[:email],
        name: user_params[:name],
        residency_location_id: user_params[:residency_location_id],
        status: user_params[:status],
        trainer: user_params[:trainer],
        admin: user_params[:admin]
      )
      redirect_to users_path
    else
      flash[:error] = {email: ['has already been taken']}
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :residency_location_id, :status, :trainer,
    :admin)
  end

  def current_user_has_access_to_user(user)
    return true if current_user.admin? || current_user == user

    if user.admin?
      return false
    elsif user.trainer? && !current_user.admin?
      return false
    elsif !current_user.trainer? && !current_user.admin?
      return false
    end

    return true
  end
end
