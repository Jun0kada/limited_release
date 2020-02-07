# frozen_string_literal: true

module LimitedRelease
  module Feature
    extend ActiveSupport::Concern

    included do
      self.const_set(:Helper, Module.new)
    end

    module ClassMethods
      def active_if(&block)
        @active_if = block
      end

      def active?(context)
        !!context.instance_eval(&@active_if)
      end

      def routes(&block)
        @routes = block if block
        @routes
      end

      def helpers(&block)
        helper = self.const_get(:Helper)
        helper.module_eval(&block) if block
        helper
      end
    end
  end
end
