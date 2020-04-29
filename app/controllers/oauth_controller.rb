require 'logger'

class OauthController < ApplicationController

    def callback
        begin
            #Rails.logger.info(request.env['omniauth.auth'])
          oauth = OauthService.new(request.env['omniauth.auth'])
          Rails.logger.info(request.env['omniauth.origin'])
          @user = oauth.create_oauth_account
          #WelcomeMailer.with(user: @user).welcome_email.deliver_later
          
           session[:user_id] = @user.id
           session[:expires_at] = Time.current + 12.hour
      
            redirect_to root_path

          #redirect_to Config.provider_login_path
        rescue => e
          flash[:alert] = "There was an error while trying to authenticate your account."
          redirect_to login_path
        end
      end
    
      def failure
        flash[:alert] = "There was an error while trying to authenticate your account."
        redirect_to login_path
      end
    
    end