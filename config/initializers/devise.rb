Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require "devise/orm/active_record"
  require "omniauth-google-oauth2"
  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 8..72

  config.reset_password_within = 6.hours

  config.scoped_views = true

  config.sign_out_via = :delete

  config.omniauth :facebook,
    ENV["pusher_app_id"],
    ENV["pusher_secret"],
    callback_url: ENV["callback_url"]
  config.omniauth :google_oauth2,
    ENV["google_client_id"],
    ENV["google_secret"],
    callback_url: ENV["callback_url"]
end
