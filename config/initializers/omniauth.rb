Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["FRIENDBC_TWITTER_CONSUMER_KEY"], ENV["FRIENDBC_TWITTER_CONSUMER_SECRET"]
end
