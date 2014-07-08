Devise.setup do |config|
  require 'devise/orm/active_record'
  require 'openid/store/filesystem'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  config.omniauth :open_id, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'google_openid', :identifier => 'https://www.google.com/accounts/o8/id', :require => 'omniauth-openid'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.sign_out_via = :delete
  config.remember_for = 4.weeks
end