# frozen_string_literal: true

module LimitedRelease
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def limited_release(name = nil)
        @_limited_release = name if name
        @_limited_release
      end
    end

    class InvalidCondition < StandardError; end

    included do
      prepend_around_action :wrap_rescue

      prepend_before_action do
        @_limited_release = self.class.limited_release&.constantize || self.class.name.split('::')[1].sub(/Controller\z/, '').classify.constantize
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
