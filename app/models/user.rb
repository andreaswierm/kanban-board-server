class User
  include Mongoid::Document

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :token, type: String
  field :refresh_token, type: String
  field :expires_at_timestamp, type: Integer
  field :secret, type: String
  field :profile_image, type: String

  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(
      provider: auth_hash.provider,
      uid: auth_hash.uid
    ).first_or_create

    user.update(
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      expires_at_timestamp: auth_hash.credentials.expires_at,
      refresh_token: auth_hash.credentials.refresh_token,
      secret: auth_hash.credentials.secret
    )

    user
  end

  def session
    @session ||= RedboothRuby::Session.new(
      token: token,
      refresh_token: refresh_token,
      auto_refresh_token: true,
      on_token_refresh: Proc.new do |old_token, new_token|
        token = new_token.token
        refresh_token = new_token.refresh_token

        save!
      end
    )
  end

  def client
    @client ||= RedboothRuby::Client.new(session)
  end
end
