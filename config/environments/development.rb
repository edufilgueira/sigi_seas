# frozen_string_literal: true

Rails.application.configure do
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #   user_name: '0d138c4d2af085',
  #   password: '0254eacd7e7680',
  #   address: 'smtp.mailtrap.io',
  #   domain: 'smtp.mailtrap.io',
  #   port: '2525',
  #   authentication: :cram_md5
  # }
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.reload_classes_only_on_change = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.perform_deliveries = true
  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  #     :address              => "smtp.gmail.com",
  #     :port                 => 587,
  #     :domain               => "gmail.com",
  #     :user_name            => "seas.ce.gov.br@gmail.com",
  #     :password             => "seas2020",
  #     :authentication       => :plain,
  #     :enable_starttls_auto => true
  # }
  logger = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger = ActiveSupport::TaggedLogging.new(logger)
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default charset: 'utf-8'
  config.action_mailer.smtp_settings = {
    address: 'relay.etice.ce.gov.br',
    port: 25,
    domain: 'etice.ce.gov.br',
    enable_starttls_auto: false
  }
end
