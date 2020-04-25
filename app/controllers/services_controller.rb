# frozen_string_literal: true
require logger
# Services
class ServicesController < ApplicationController
  def index
    @services = if search_params.blank?
                  Service.all
                else
                  Service.all.where('category LIKE :search',
                                    search: search_params)
                end
  end

  def new; end

  def create
    @pro = Professional.new(professional_params)
    @user = User.new(user_params)
    @user.role = User.user_roles[:pro]
    @user.save!
    @pro.service_id = Service.find_by(category: service_params[:category]).id
    @pro.user_id = @user.id
    @pro.stripe_state = SecureRandom.uuid
    @pro.save!
    WelcomeMailer.with(user: @user).pro_welcome_email.deliver_later
    session[:user_id] = @user.id
    # Redirect to creating a professional
    redirect_to service_professional_path(service_id: @pro.service_id, id: @pro.id)
  end

  def show
    @service = Service.find(params[:id])
    @client_id = Rails.application.credentials.stripe[:client_id]
    logger.info("Client id #{@client_id}")
  end

  private

  def service_params
    params.require(:service).permit(:name, :category)
  end

  def professional_params
    params.require(:service).permit(:first_name, :last_name, :description)
  end

  def user_params
    params.require(:service).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def search_params
    params[:search]
  end
end
