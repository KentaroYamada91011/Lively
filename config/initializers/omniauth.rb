Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  configure do |config|
    config.full_host = "https://lively-project.herokuapp.com/"
  end
end
