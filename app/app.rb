class [Replace] < Padrino::Application
  set :root, File.dirname(__FILE__)
  set :haml, { :format => :html5 }
  set :less, { :load_paths => [ "#{File.dirname(__FILE__)}/assets/stylesheets" ] }

  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  # This is for liquid
  # register Padrino::Liquid
  register Sinatra::Can
  register Sinatra::AssetPack

  #
  # => Omni Auth
  #

  use OmniAuth::Builder do
    provider :template,  ENV['API_OAUTH_ID'], ENV['API_OAUTH_SECRET'], :client_options =>  {:site => ENV['API_OAUTH_SITE']}
  end

  #
  # => Permissions
  #

  user do
    current_user if signed_in?
  end

  ability do |user|
    if user
      can :read, :all if user.is_superuser?
    end
  end

  error 403 do
    if current_user
      'not authorized'
    else
      session[:redirect_url] = request.url
      redirect :refresh
    end
  end

  #
  # => Assets
  #

  assets {
    # js_compression :uglify

    serve '/css',    from: 'assets/stylesheets'
    serve '/js',     from: 'assets/javascripts'
    serve '/images', from: 'assets/images'

    css :application, [
      '/css/bootstrap/bootstrap.css',
      '/css/template.css'
    ]

    js :application, [
      '/js/jquery/v1.7.1.js',
      '/js/bootstrap/alert.js',
      '/js/bootstrap/button.js',
      '/js/bootstrap/dropdown.js',
      '/js/bootstrap/modal.js',
      '/js/bootstrap/tab.js',
      '/js/underscore/v1.3.1.js',
      '/js/backbone/v0.9.1.js',
      '/js/liquid.js'
    ]

    prebuild Padrino.env == 'production'
  }

  # This is for liquid
  # before do
  #   ::AssetsRenderCss = self.method(:css)
  #   ::AssetsRenderJs  = self.method(:js)
  # end

# This is a fix for:
# Capybara::Driver::Webkit::WebkitInvalidResponseError:
#   Unable to load URL: http://127.0.0.1:53529/calls
  module Routing
    module ClassMethods
      private
        def provides(*args)
          super *args if Padrino.env != :test
        end
    end
  end
end