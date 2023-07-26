if ENV["RAILS_LOG_TO_STDOUT"].present?
  logger           = ActiveSupport::Logger.new(STDOUT)
  logger.formatter = config.log_formatter
  config.logger    = ActiveSupport::TaggedLogging.new(logger)
end

# Do not dump schema after migrations.
config.active_record.dump_schema_after_migration = false
end

server '54.248.130.187', user: 'ec2-user', roles: %w{app db web}
