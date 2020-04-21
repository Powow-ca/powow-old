class StripeService

  def validate_connect_account(stripe_code:)
    Stripe.api_key = 'sk_test_URdOP6CXoZc5MIJcXU1KC9tw00HjkxQKU9'
    begin
      Stripe::OAuth.token({
        grant_type: 'authorization_code',
        code: stripe_code,
      })
    rescue Stripe::OAuth::InvalidGrantError
      status 400
        {error: 'Invalid authorization code: ' + code}.to_json
    rescue Stripe::StripeError
      status 500
        {error: 'An unknown error occurred.'}.to_json
    end
  end
end