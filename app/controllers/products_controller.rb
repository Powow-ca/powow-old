# frozen_string_literal: true

class ProductsController < ApplicationController
  def new
    @pro = pro_params
  end

  def create
    @pro = Professional.find_by(user_id: current_user.id)
    @product = Product.new(product_params)
    @product.professional_id = @pro.id
    @product.save!
    redirect_to(service_professional_url(id: @pro.id, service_id: @pro.service_id))
  end

  def product_params
    params.require(:product).permit(:name, :target_audience, :description,
                                    :summary, :label, :details, :price)
  end

  def pro_params
    params[:pro] || ''
  end
end
