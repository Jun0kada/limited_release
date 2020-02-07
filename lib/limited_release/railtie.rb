# frozen_string_literal: true

module LimitedRelease
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load :after_initialize do
      ::Rails.application.routes.prepend do
        namespace ::LimitedRelease.config.controller_namespace, path: nil do
          ::LimitedRelease.features.each do |feature|
            self.instance_eval(&feature.routes) if feature.routes
          end
        end
      end
    end

    ActiveSupport.on_load :action_controller do
      ActionController::Base.include ::LimitedRelease::Controller
    end

    if ::Rails.env.development?
      initializer 'limited_release.insert_reloader' do |app|
        app.config.middleware.use ::LimitedRelease::Reloader
      end
    end
  end
end
