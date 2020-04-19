class StripeController < ApplicationController
  require 'stripe'

def index
Stripe.api_key = 'sk_test_URdOP6CXoZc5MIJcXU1KC9tw00HjkxQKU9'

 @intent = Stripe::PaymentIntent.create({
  amount: 1000,
  currency: 'usd',
  payment_method_types: ['card'],
  receipt_email: 'nipunsud123@gmail.com',
  })

  render :checkout
end

def checkout

end

end