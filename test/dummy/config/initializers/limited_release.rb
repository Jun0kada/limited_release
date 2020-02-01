LimitedRelease.configure do |config|
  config.on_error = -> (e) do
    ::Rails.logger.error(e)
    ::Rails.logger.error(e.backtrace.join("\n"))
  end
end
