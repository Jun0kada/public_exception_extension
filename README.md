# PublicExceptionExtension
Custom public error template

## Usage
```ruby
# config/initializers/public_exception.rb

Rails.application.config.public_exception_template = -> (request, status) do
  if request.original_fullpath.start_with?('/admin')
    "/admin/#{status}.html" # => render /public/admin/xxx.html
  end
end

```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'public_exception_extension'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install public_exception_extension
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
