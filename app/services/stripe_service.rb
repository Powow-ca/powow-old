# frozen_string_literal: true

class StripeService
  def validate_connect_account(stripe_code:, stripe_state:, pro:)
    Stripe.api_key = Rails.application.credentials.stripe[:api_key]
    
    if !state_matches?(state: stripe_state, pro: pro)
      status 403
      return {error: 'Incorrect state parameter: ' + state}.to_json
    end
    begin
      Stripe::OAuth.token({
                            grant_type: 'authorization_code',
                            code: stripe_code
                          })
    rescue Stripe::OAuth::InvalidGrantError
      status 400
      { error: 'Invalid authorization code: ' + code }.to_json
    rescue Stripe::StripeError
      status 500
      { error: 'An unknown error occurred.' }.to_json
    end
  end

  def state_matches?(state:, pro:)
    # Load the same state value that you randomly generated for your OAuth link.
    pro.stripe_state == state
  end
end
