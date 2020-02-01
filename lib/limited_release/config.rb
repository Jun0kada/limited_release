# frozen_string_literal: true

module LimitedRelease
  include ActiveSupport::Configurable

  configure do |config|
    config.on_error = -> (e) do
      if ::Rails.env.development? || ::Rails.env.test?
        raise e
      else
        ::Rails.logger.error(e)
        ::Rails.logger.error(e.backtrace.join("\n"))
      end
    end
  end
end
