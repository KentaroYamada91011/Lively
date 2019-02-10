Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter,
    ENV["CmZmFuOYFs5yETkInsR6yaAU8"],
    ENV["Ayp116LsfbYH9nM4dwHQjmWfUWfM59IjVlkiHWaoVzssBM7JQG"]
end
