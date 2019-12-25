$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'public_exception_extension/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'public_exception_extension'
  spec.version     = PublicExceptionExtension::VERSION
  spec.authors     = ['Jun0kada']
  spec.email       = ['jun.0kada.dev@gmail.com']
  spec.homepage    = 'https://github.com/Jun0kada/public_exception_extension'
  spec.summary     = 'Custom public error template'
  spec.description = 'Custom public error template'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'sqlite3'
end
