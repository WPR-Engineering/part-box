class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper :quantity
  before_action :set_paper_trail_whodunnit
  
  
  rescue_from CanCan::AccessDenied do |exception|
  respond_to do |format|
    format.json { head :forbidden, content_type: 'text/html' }
    format.html { redirect_back fallback_location: '/', alert: exception.message }
    format.js   { head :forbidden, content_type: 'text/html' }
  end
end


end
