# frozen_string_literal: true
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
    @pro.service_id = Service.find_by(category: service_params[:category]).id
    @pro.user_id = current_user.id
    @pro.stripe_state = SecureRandom.uuid
    @pro.save!
    WelcomeMailer.with(user: current_user).pro_welcome_email.deliver_later
    # Redirect to creating a professional
    redirect_to service_professional_path(service_id: @pro.service_id, id: @pro.id)
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

  def search_params
    params[:search]
  end
end
