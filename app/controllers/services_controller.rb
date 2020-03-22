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
    @service = Service.new(service_params)
    # @service.professionals.new(professional_params)
    @service.save
    # Redirect to creating a professional
    redirect_to new_service_professional_path(@service)
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
    params[:search].downcase
  end
end
