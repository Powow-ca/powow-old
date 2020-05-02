require 'logger'

class OauthController < ApplicationController

    def callback
        begin
            #Rails.logger.info(request.env['omniauth.auth'])
          Rails.logger.info(request.env['omniauth.origin'])
          Rails.logger.info("Current user #{current_user.nil?}")
          @user = current_user.nil? ? OauthService.new(request.env['omniauth.auth']).create_oauth_account(origin: request.env['omniauth.origin']) : current_user
          
          #WelcomeMailer.with(user: @user).welcome_email.deliver_later
          
           session[:user_id] = @user.id
           session[:expires_at] = Time.current + 1.hour
      
          if @user.role == User.user_roles[:client]
            redirect_to root_path
          elsif @user.role == User.user_roles[:pro]
            @pro = Professional.find_by(user_id: @user.id)
            if @pro.nil?
              flash[:alert] = "You are now signed in, please continue to complete your profile"
              redirect_to new_service_path
            else
              redirect_to service_professional_path(service_id: current_user.professionals.first.service_id, id: current_user.professionals.first.id)
            end
            
          end
          

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