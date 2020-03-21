class ProfessionalsController < ApplicationController
  
  def index
    @professionals = Professional.all
  end

  def new
    
  end

  def create
    @professional = Professional.create!(article_params)

    redirect_to @professional
  end

  def show
    @professional = Professional.find(params[:id])
  end

  private 
    def article_params
        params.require(:professional).permit(:first_name, :last_name, :description)
    end
  
end
