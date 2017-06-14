if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_WiW3ZHF0ElSytucx2vWNMlRW',
    secret_key: 'sk_test_vUgDhy3vionQSnja0ZKS94bl'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]