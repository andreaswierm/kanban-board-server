Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redbooth, Rails.application.secrets.redbooth_client_id, Rails.application.secrets.redbooth_client_secret
end