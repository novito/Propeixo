class ApplicationController < ActionController::Base
  protect_from_forgery

  def permission_denied
    flash[:notice] = 'Sorry, you are not authorized to access that page.'
    redirect_to root_url and return
  end

end
