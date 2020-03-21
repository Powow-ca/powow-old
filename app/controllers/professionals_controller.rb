class ProfessionalsController < ApplicationController
  
  def index
    @professionals = Professional.all
  end

  def new
    
  end

  def create
    @service = Service.find(params[:service_id])
    @professional = Professional.new(article_params)
     @service.professionals.new(article_params) 
     @service.save
    redirect_to service_path(@service)
  end

  def show
    @professional = Professional.find(params[:id])
  end

  private 
    def article_params
        params.require(:professional).permit(:first_name, :last_name, :description)
    end
  
end
