OmniAuth.config.full_host = "https://lively-project.herokuapp.com" # フロントのURL

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  on_failure { |env| AuthenticationsController.action(:failure).call(env) }
end
