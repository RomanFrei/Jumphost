class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user

  def get_memberships
      if current_user
        @memberships = Member.all(:conditions => { :user_id => current_user.id })
      end
  end
  
  private

  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
    return false
  end
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end
