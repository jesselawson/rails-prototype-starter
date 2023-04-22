class ErrorsController < ApplicationController
  skip_before_action :set_current_user
  layout "static_page"

  def not_found
    render status: 404
  end

  def internal_error
    render status: 500
  end

  def unprocessable
    render status: 422
  end

  def unacceptable
    render status: 406
  end
end
