# LimitedRelease
A simple, safe and rapid prototyping framework for Rails

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'limited_release'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install limited_release
```

## Usage

```ruby
# config/limited_releases/top_page_design.rb

class TopPageDesign
  include LimitedRelease::Feature

  active_if do
    params[:new_design].present?
  end

  routes do
    get '/', to: 'top_page_designs#show', as: 'top_page_design'
  end

  helpers do
    def title
      'Welcome to New Design!'
    end
  end
end
```

```ruby
# app/controllers/limited_release/top_page_designs_controller.rb

class LimitedRelease::TopPageDesignsController < TopController
  ## you can specify limited_release class name
  # limited_release 'TopPageDesign'

  def show
    super
  end
end
```

```html
<!-- app/views/limited_release/top_page_designs/show.html.erb -->

<h1><%= title %></h1>
...
```

[Other examples](https://github.com/Jun0kada/limited_release/tree/master/test/dummy)

### Config

```ruby
# config/initializers/limited_release.rb
require 'limited_release'

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
Bug reports and pull requests are welcome on GitHub at https://github.com/Jun0kada/limited_release

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
