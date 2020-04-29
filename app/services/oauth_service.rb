require 'logger'
class OauthService
    attr_reader :auth_hash
  
    def initialize(auth_hash)
      @auth_hash = auth_hash
      
    end
  
    def create_oauth_account
      Rails.logger.info "Inside Service!"
      Rails.logger.info(@auth_hash)
      #Rails.logger.info(oauth_account_params)
      Rails.logger.info oauth_account_params

      oauth_account = oauth_account_params
      @user=User.find_by(email:oauth_account_params[:email])
      if !@user.nil?
        Rails.logger.info "Updating user!"
        @user.update(linkedin_token:oauth_account_params[:token])
        @user.save!
      else
        @user=User.create!(first_name:oauth_account_params[:first_name],last_name:oauth_account_params[:last_name],email:oauth_account_params[:email],linkedin_token:oauth_account_params[:token],role:User.user_roles[:client],password_digest:'1234')        
        
      end


      @user
    end
  
  private
  
    def oauth_account_params
      { uid: @auth_hash[:uid],
        token: @auth_hash[:credentials][:token],
        provider: @auth_hash[:provider],  
        email: @auth_hash[:info][:email],
        first_name:@auth_hash[:info][:first_name],              
        last_name:@auth_hash[:info][:last_name],
        picture_url:@auth_hash[:info][:picture_url],
        raw_data: @auth_hash[:extra][:raw_info].to_json }
    end
  
  end