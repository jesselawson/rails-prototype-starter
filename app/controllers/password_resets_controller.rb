class PasswordResetsController < ApplicationController
  def new
  end

  def create
    # Is this a real user?
    @user = User.find_by(email: params[:email])

    if @user.present?
      # Send email

      # Tell the PasswordMailer to wake up and send an email with (about) this user
      # Send the "reset" template
      # deliver_later means the browser response will be instant, and a background
      # job will send the email right away
      PasswordMailer.with(user: @user).reset.deliver_now
    end

    redirect_to root_path,
                notice:
                  "If an account with that email was found, we have sent a link to reset your password"
  end

  def edit
    @user = User.find_signed(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: "Your token has expired. Please try again."
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path,
                  notice:
                    "Your password was reset successfully. Please sign in."
    else
      render :edit
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
