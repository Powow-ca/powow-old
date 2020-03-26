# frozen_string_literal: true

class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :isPro?

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

  def isAdmin?
    @current_user.role == User.user_roles[:admin]
  end

  def isPro?
    @current_user.role == User.user_roles[:pro]
  end

  def isClient?
    @current_user.role == User.user_roles[:client]
  end
end
