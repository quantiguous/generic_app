$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "base/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "base"
  s.version     = Base::VERSION
  s.authors     = ["Lavanya"]
  s.email       = ["lavanya.ramamoorthy@quantiguous.com"]
  # s.homepage    = "generic_app"
  s.summary     = "Contains users and admin users models"
  s.description = "Base model app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "activerecord", "4.2.6"
  s.add_dependency "devise", ">= 2.2.3"
  s.add_dependency 'cancancan', '~> 1.10'
  s.add_dependency 'mime-types'
  s.add_dependency "rolify", ">= 3.2.0"
  s.add_dependency "devise_ldap_authenticatable", '0.6.1'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "database_cleaner"
end
