source 'https://rubygems.org'
ruby "2.2.2"
gem 'roo'
gem "flot-rails"
gem 'rails', '4.2.2'
gem 'haml-rails'
gem "devise", ">= 2.2.3"
gem 'cancancan', '~> 1.10'
gem 'mime-types'
gem "rolify", ">= 3.2.0"
gem "devise_ldap_authenticatable", '0.6.1'
gem 'will_paginate'
gem 'jquery-rails','2.0.2'
gem 'carrierwave'
gem 'nested_form'
gem 'simple_form'
gem 'whenever', :require => false
gem 'acts_as_commentable', '3.0.1'
gem 'stringex'
gem 'activeadmin',  '~> 1.0.0.pre1'
gem "state_machine", "~> 1.2.0"
gem 'sunspot_rails'
gem 'rufus-scheduler'
gem 'simple-navigation'
gem 'progress_bar', '~> 1.0.0'
gem 'chosen-rails', '1.0.0'
gem 'turnout'
gem 'delayed_job_active_record'
gem 'rools', '0.4.1', :git=>'https://github.com/quantiguous/rools'
gem 'devise_security_extension'
gem 'secure_headers'
gem 'acts_as_list'
gem 'activeadmin-sortable'
gem 'therubyracer'
gem "daemons"
gem "sqlite3"
gem 'dotenv'
gem 'kaminari'
gem 'seed-fu'

# Used only if oracle db is being used
group :production do
  gem 'activerecord-oracle_enhanced-adapter',:git => 'git://github.com/rsim/oracle-enhanced.git'
  gem 'ruby-oci8'
  gem 'bcdatabase'
  gem 'passenger'
  gem 'rails_12factor'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end


group :development, :test do
  gem 'sunspot_solr'
  gem "rspec"
  gem 'rspec-rails', "2.14.0"
  gem 'rb-readline'
  gem "spork", "> 0.9.0.rc", :require => false
  gem "factory_girl", "2.2.0"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem 'database_cleaner', '< 1.1.0'
  gem 'timecop'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem "unicorn"
  gem 'rake'
  gem 'guard-rspec'
  gem 'test-unit'
  gem 'guard-cucumber'
  gem 'cucumber-rails', :require => false
  gem 'coveralls', :require => false
  gem 'selenium-webdriver'
  gem 'faker'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
end

group :test do
  gem 'webmock'
end
