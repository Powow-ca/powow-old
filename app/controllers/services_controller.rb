# frozen_string_literal: true

# Services
class ServicesController < ApplicationController
  def index
    @services = Service.all
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
end
