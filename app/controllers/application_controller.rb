class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token # disabling check for authenticity_token
    helper_method :current_user, :logged_in? # gives our views access to our controller methods
    # views by default don't have access to methods defined within the controllers

    def login!(user)
        # user is logged in when User.session_token == cookies session_token from browser
        session[:session_token] = user.reset_session_token!
        # ^setting session[:session_token] from browser to user's session_token
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
        # session[:session_token] is the session object's session_token from the browser
    end

    def logged_in?
        !!current_user # this is our current_user method
        # current_user returns either nil or User object
        # !current_user returns true or false, but opposite of our truthy or falsey value
        # !!current_user returns original true or false status
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end

end
