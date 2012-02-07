load "env.rb"


# Defines our constants
PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)
# Load our custom dependencies
require Padrino.root("config", "omniauth.rb") # File.expand_path("../omniauth.rb", __FILE__)
# Adds a bit of power to liquid
# require File.expand_path("../liquid.rb", __FILE__)
require 'simple_enum/enum_hash'
require 'simple_enum/validation'
# SimpleEnum.default_options[:prefix] = true

##
# Enable devel logging
#
Padrino::Logger::Config[:test] = { :log_level => :devel, :stream => :to_file }
# Padrino::Logger.log_static = true
#

##
# Add your before load hooks here
#
Padrino.before_load do
end

##
# Add your after load hooks here
#
Padrino.after_load do
  ActiveRecord::Base.connection.close
  Encoding.default_internal = nil
end

Padrino.load!
