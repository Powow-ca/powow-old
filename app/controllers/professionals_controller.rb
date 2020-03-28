# frozen_string_literal: true

class ProfessionalsController < ApplicationController
  before_action :authorized, only: [:show]

  # def index
  #   @professionals = Professional.all
  # end

  def new; end

  def create
    @service = Service.find(params[:service_id])
    @service.professionals.new(article_params)
    @service.save
    redirect_to service_path(@service)
  end

  def show
  @professional = Professional.find_by(service_id: params[:service_id], id: params[:id])
  end

  def edit
    @professional = Professional.find(params[:id])
  end

  private

  def article_params
    params.require(:professional).permit(:first_name, :last_name, :description)
  end
end
