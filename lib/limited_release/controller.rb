# frozen_string_literal: true

module LimitedRelease
  module Controller
    extend ActiveSupport::Concern

    class InvalidCondition < StandardError; end

    included do
      prepend_around_action :wrap_rescue

      prepend_before_action do
        LimitedRelease.load_features if ::Rails.env.development?

        @_limited_release = self.class.name.split('::')[1].sub(/Controller\z/, '').constantize
      end

      before_action do
        raise InvalidCondition unless @_limited_release.active?(self)

        self.class.helper @_limited_release.helpers
      end
    end

    def wrap_rescue
      begin
        yield
      rescue LimitedRelease::Controller::InvalidCondition
        headers['X-Cascade'] = 'pass'
      rescue => e
        headers['X-Cascade'] = 'pass'

        LimitedRelease.config.on_error.call(e)
      end
    end
  end
end
