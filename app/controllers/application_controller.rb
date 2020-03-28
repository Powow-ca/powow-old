# frozen_string_literal: true

class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :isPro?

    def current_user
        if session[:user_id]
          # @professional = Professional.find_by(user_id: session[:user_id])
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
    if !@current_user.nil?
      @current_user.role == User.user_roles[:admin]
    else
      false
    end
  end

  def isPro?
    if !@current_user.nil?
      @current_user.role == User.user_roles[:pro]
    else
      false
    end
  end

  def isClient?
    @current_user.role == User.user_roles[:client]
  end
end
