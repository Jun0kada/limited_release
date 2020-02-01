# frozen_string_literal: true

require 'limited_release/railtie'
require 'limited_release/config'
require 'limited_release/feature'
require 'limited_release/controller'

module LimitedRelease
  def self.load_features
    @features = Dir[::Rails.root.join('config', 'limited_releases', '*.rb')].map do |path|
      load path
      File.basename(path, '.rb').classify.constantize
    end
  end
end
