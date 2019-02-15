OmniAuth.config.full_host = "https://lively-project.herokuapp.com" # フロントのURL

Rails.application.config.middleware.use OmniAuth::Builder do
  # require 'omniauth/strategies/twitter_another'
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],info_fields:"nickname, image"
  on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end
