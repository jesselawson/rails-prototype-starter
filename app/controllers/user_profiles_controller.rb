class UserProfilesController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(password_params)
      redirect_to user_profile_path, notice: "All changes saved."
    else
      render :edit
    end
  end

  private

  def password_params
    # This only allows us to change our password
    params.require(:user).permit(:password, :password_confirmation)
  end
end
