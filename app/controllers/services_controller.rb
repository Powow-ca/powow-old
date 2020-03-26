# frozen_string_literal: true

# Services
class ServicesController < ApplicationController

  def index
    @services = if search_params.blank?
                  Service.all
                else
                  Service.all.where('lower(name) LIKE :search',
                                    search: search_params)
                end
  end

  def new; end

  def create
    @pro = Professional.new(professional_params)
    @user = User.new(user_params)
    @user.role = User.user_roles[:pro]
    @user.save
    @service = Service.new(service_params)
    # @service.professionals.new(professional_params)
    @service.save
    @pro.service_id = @service.id
    @pro.user_id = @user.id
    @pro.save
    session[:user_id] = @user.id
    # Redirect to creating a professional
    redirect_to service_professional_path(service_id: @service.id, id: @service.professionals.last.id)
  end

  def show
    @service = Service.find(params[:id])
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
    params[:search] ? params[:search].downcase : ''
  end
end
