# frozen_string_literal: true

require 'limited_release/railtie'
require 'limited_release/config'
require 'limited_release/feature'
require 'limited_release/controller'
require 'limited_release/reloader'

module LimitedRelease
  def self.features
    @features ||= Dir[::Rails.root.join('config', 'limited_releases', '**', '*.rb')].sort_by { |path| path.split('/').length }.map do |path|
      name = path.gsub(/(.+limited_releases\/|\.rb\z)/, '').classify

      Object.send(:remove_const, name.split('::').first) if Object.const_defined?(name.split('::').first)

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
