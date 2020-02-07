# frozen_string_literal: true

require 'limited_release/railtie'
require 'limited_release/config'
require 'limited_release/feature'
require 'limited_release/controller'
require 'limited_release/reloader'

module LimitedRelease
  def self.features
    @features ||= Dir[::Rails.root.join('config', 'limited_releases', '*.rb')].map do |path|
      name = File.basename(path, '.rb').classify

      Object.send(:remove_const, name) if Object.const_defined?(name)

      load path
      name.constantize
    end
  end

  def self.reload!
    @features = nil
    self.features

    true
  end
end
