# frozen_string_literal: true

module LimitedRelease
  class Reloader
    def initialize(app)
      @app = app

      @reloader = ActiveSupport::FileUpdateChecker.new(Dir[::Rails.root.join('config', 'limited_releases', '**', '*.rb')]) do
        ::LimitedRelease.reload!
        ::Rails.application.reloader.reload!
      end
    end

    def call(env)
      @reloader.execute_if_updated

      @app.call(env)
    end
  end
end
