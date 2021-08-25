# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = "https://84a15b3d64814e449f46e64af827001a:f952338fbc3146dd9d12af003bbc7e55@o277670.ingest.sentry.io/2238254"
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  # config.environments = %w[production]
  # config.proxy = 'http://172.26.2.31:80'
end
