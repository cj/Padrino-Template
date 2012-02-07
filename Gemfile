source :rubygems

# Server requirements (defaults to WEBrick)
# gem 'thin'
# gem 'mongrel'

# Project requirements
gem 'rake'
gem 'haml'
gem 'liquify'
gem 'liquid'
gem 'twilio-rb'
gem 'oauth2'
gem 'coffee-script'
gem 'less'
gem 'thin'
# https://github.com/bookworm/padrino-responders
gem 'padrino-responders', git: 'git://github.com/cj/padrino-responders.git'
gem 'sinatra-flash', require: 'sinatra/flash'
# https://github.com/rstacruz/sinatra-assetpack
gem 'sinatra-assetpack', require: 'sinatra/assetpack', git: 'git://github.com/rstacruz/sinatra-assetpack.git'
# https://github.com/Cirex/padrino-csrf
gem 'padrino-csrf'
# https://github.com/shf/sinatra-can
gem 'sinatra-can', require: 'sinatra/can'
# http://sinefunc.com/sinatra-support/
gem "sinatra-support", require: "sinatra/support"
# http://compass-style.org/install/
gem 'compass'
# https://github.com/intridea/omniauth-oauth2
gem 'omniauth-oauth2', require: "omniauth-oauth2"
# https://github.com/rails/jbuilder
gem 'jbuilder', require: 'jbuilder'
# http://rubyworks.github.com/hashery/
gem 'hashery', require: 'hashery/open_cascade'

# https://github.com/DAddYE/mini_record
gem 'mini_record', git: 'git://github.com/DAddYE/mini_record.git'

# Component requirements
gem 'activerecord', :require => "active_record"
gem 'activeresource', :require => "active_resource"
gem 'mysql'
# https://github.com/lwe/simple_enum
gem 'simple_enum', git: 'git://github.com/lwe/simple_enum.git', require: 'simple_enum'

# Test requirements
gem 'rspec', :group => "test"
gem 'rack-test', :require => "rack/test", :group => "test"

# Padrino Stable Gem
gem 'padrino', git: 'git://github.com/padrino/padrino-framework.git' #, '0.10.5'

group :test, :development do
  gem "factory_girl_rails", ">= 1.4.0"
  gem "capybara", ">= 1.1.2"
  gem 'capybara-webkit', git: 'git://github.com/rud/capybara-webkit.git'
  # gem 'capybara-mechanize'
  gem "guard-rspec"
  gem 'spork', '~> 0.9.0.rc'
  gem "guard-spork"
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'ruby_gntp', :require => false
  gem 'launchy'
  gem 'database_cleaner'
  gem 'mocha'
  # gem 'webmock'
  gem 'hpricot'
  gem 'vcr'
  gem 'fakeweb'
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.5'
# end
