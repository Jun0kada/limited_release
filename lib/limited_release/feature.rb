# frozen_string_literal: true

module LimitedRelease
  module Feature
    extend ActiveSupport::Concern

    module ClassMethods
      def active_if(&block)
        @active_if = block
      end

      def active?(context)
        context.instance_eval(&@active_if)
      end

      def routes(&block)
        @routes = block if block
        @routes
      end
    end
  end
end
