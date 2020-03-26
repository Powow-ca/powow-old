# frozen_string_literal: true

class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
        if session[:user_id]
          @current_user ||= User.find(session[:user_id])
        else
          @current_user = nil
        end
    end

    def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
  
end
