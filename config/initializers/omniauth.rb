Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development?
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  else
    provider :facebook, ENV['FACEBOOK_KEY_PRODUCTION'], ENV['FACEBOOK_SECRET_PRODUCTION']
  end
end
