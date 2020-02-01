# frozen_string_literal: true

class LimitedReleaseGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_config_file
    template 'config.rb', "config/limited_releases/#{file_name}.rb"
  end

  private

  def file_name
    name.gsub('/', '_').underscore
  end

  def class_name
    file_name.classify
  end
end
