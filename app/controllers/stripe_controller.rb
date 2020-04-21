class StripeController < ApplicationController
  require 'stripe'

def initiate_payment
Stripe.api_key = 'sk_test_URdOP6CXoZc5MIJcXU1KC9tw00HjkxQKU9'

@session = Stripe::Checkout::Session.create({
  payment_method_types: ['card'],
  line_items: [{
    name: "Kavholm rental",
    amount: 1000,
    currency: 'cad',
    quantity: 1,
  }],
  payment_intent_data: {
    application_fee_amount: 123,
    transfer_data: {
      destination: Professional.find(params[:professional]).stripe_user_id,
    },
  },
  success_url: 'https://example.com/success',
  cancel_url: 'https://example.com/failure',
})
  render :checkout
end

def checkout

end

def create_account
  @response = StripeService.new.validate_connect_account(stripe_code: code)
  @professional = Professional.find_by(user_id: current_user.id)
  @professional.stripe_user_id = @response.stripe_user_id
  @professional.save
  redirect_to service_professional_path(service_id: @professional.service_id, id: @professional.id) 
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

def pro
  @pro ||= params['pro']
end


end