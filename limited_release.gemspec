$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'limited_release/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'limited_release'
  spec.version     = LimitedRelease::VERSION
  spec.authors     = ['Jun0kada']
  spec.email       = ['jun.0kada.dev@gmail.com']
  spec.homepage    = 'https://github.com/Jun0kada/limited_release'
  spec.summary     = 'A simple, safe and rapid prototyping framework'
  spec.description = 'A simple, safe and rapid prototyping framework'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'sqlite3'
end
