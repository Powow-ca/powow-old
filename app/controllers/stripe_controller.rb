# frozen_string_literal: true

class StripeController < ApplicationController
  require 'stripe'

  def initiate_payment
    @product = Product.find(product)
    return if Professional.find(@product.professional_id).stripe_user_id.nil?

    @order = Order.new(status: Order.statuses[:pending], product_id: product, user_id: current_user.id,
                       payment_gateway: Order.payment_gateways[:stripe])
    @order.save!

    Stripe.api_key = Rails.application.credentials.stripe[:api_key]
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: @product.name,
                                                    amount: @product.price.to_i * 100,
                                                    currency: 'cad',
                                                    quantity: 1
                                                  }],
                                                  payment_intent_data: {
                                                    application_fee_amount: 123,
                                                    transfer_data: {
                                                      destination: Professional.find(@product.professional_id).stripe_user_id
                                                    }
                                                  },
                                                  success_url: "#{root_url}success?order=#{@order.id}",
                                                  cancel_url: "#{root_url}failure"
                                                })
    render :checkout
  end

  def checkout; end

  def create_account
    @response = StripeService.new.validate_connect_account(stripe_code: code)
    @professional = Professional.find_by(user_id: current_user.id)
    @professional.stripe_user_id = @response.stripe_user_id
    @professional.save
    redirect_to service_professional_path(service_id: @professional.service_id, id: @professional.id)
  end

  def order_success
    @order = Order.find(params[:order])
    @order.status = Order.statuses[:paid]
    @order.save
  end

  def code
    @code ||= params['code']
  end

  def user
    @user ||= params[:current_user]
  end

  def state_params
    logger.debug "params[:state] #{params[:state]}"
    params[:state] ? params[:state].downcase : ''
  end

  def product
    params[:product]
  end
end
