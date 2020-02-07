# frozen_string_literal: true

module LimitedRelease
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def limited_release(name = nil)
        @_limited_release = name.to_s if name
        @_limited_release
      end
    end

    class InvalidCondition < StandardError; end

    included do
      with_options if: :limited_release_controller? do
        around_action :wrap_rescue
        before_action :set_limited_release
        before_action :check_limited_release_condition
        before_action :append_limited_release_helper
      end
    end

    private

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

    def set_limited_release
      @_limited_release = self.class.limited_release&.constantize || self.class.name.split('::')[1].sub(/Controller\z/, '').classify.constantize
    end

    def check_limited_release_condition
      raise InvalidCondition unless @_limited_release.active?(self)
    end

    def append_limited_release_helper
      self.class.helper @_limited_release.helpers
    end

    def limited_release_controller?
      self.class.name.split('::').first == LimitedRelease.config.controller_namespace.to_s.classify
    end
  end
end
