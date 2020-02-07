# LimitedRelease
Short description and motivation.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'limited_release'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install limited_release
```

## Usage

### View override
### Controller override
### Add path
### Helper method

### Config

```ruby
# config/initializers/limited_release.rb

LimitedRelease.configure do |config|
  config.controller_namespace = :limited_release

  config.on_error = -> (e) do
    if ::Rails.env.development? || ::Rails.env.test?
      raise e
    else
      ::Rails.logger.error(e)
      ::Rails.logger.error(e.backtrace.join("\n"))
    end
  end
end
```

## Generator

```
$ rails generate limited_release FEATURE_NAME
```

### Example
```
$ rails generate limited_release new_feature
```

create `config/limited_releases/new_feature.rb`


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
