# frozen_string_literal: true

module LimitedRelease
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :after_initialize do
      Rails.application.routes.prepend do
        LimitedRelease.load_features.each do |feature|
          namespace :limited_release, path: nil do
            self.instance_eval(&feature.routes)
          end
        end
      end
    end
  end
end
