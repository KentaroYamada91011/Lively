OmniAuth.config.full_host = "https://lively-project.herokuapp.com" # フロントのURL
# require 'omniauth/strategies/twitter_another'
Rails.application.config.middleware.use OmniAuth::Builder do
  # require 'omniauth/strategies/twitter_another'
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],info_fields:"nickname, image", request_path: '/auth/twitter', callback_path: '/auth/twitter/callback'
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'],info_fields:"nickname, image", request_path: '/auth/another/twitter', callback_path: '/auth/another/twitter/callback'
end
