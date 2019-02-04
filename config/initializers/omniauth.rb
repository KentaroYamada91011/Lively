Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter,
    ENV["09fSS4dmazC2gGQnhJUjf9wx5"],
    ENV["NdtCiQFGpzUTkZ86l9qQxvTFHSgG0kaKYEWhOJ66qBolLeGsr0"]
end
