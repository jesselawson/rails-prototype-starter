class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save #if it's saved successfully in the db
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Your account has been created!"
    else
      render :new #new.html.erb
    end
  end

  def user_params
    # Only lets them set the attributes listed in .permit
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
