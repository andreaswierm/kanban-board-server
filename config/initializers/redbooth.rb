RedboothRuby.config do |configuration|
  configuration[:consumer_key] = Rails.application.secrets.redbooth_client_id
  configuration[:consumer_secret] = Rails.application.secrets.redbooth_client_secret
end
