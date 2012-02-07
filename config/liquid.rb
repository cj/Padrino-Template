class CssLiquid < Liquid::Tag

  def initialize(tag_name, params, tokens)
     super
     # .strip! is trim in php
     @params = []
     @params = params.strip!.split(' ') if params.strip!
  end

  def render(context)
    assets = @params.first || 'application'
    ::AssetsRenderCss.call(assets.to_sym, media: 'screen')
  end
end

class JsLiquid < Liquid::Tag

  def initialize(tag_name, params, tokens)
     super
     # .strip! is trim in php
     @params = []
     @params = params.strip!.split(' ') if params.strip!
  end

  def render(context)
    assets = @params.first || 'application'
    ::AssetsRenderJs.call(assets.to_sym)
  end
end

module Padrino
  module Liquid
    module Helpers
      def render(engine, data=nil, options={}, locals={}, &block)

        # Set current user if it exists
        @current_user = current_user if current_user

        # Create asset tags
        ::Liquid::Template.register_tag('css', CssLiquid)
        ::Liquid::Template.register_tag('js', JsLiquid)

        # Create instance variables
        ignored_ivs = [
          '@default_layout',
          '@app',
          '@template_cache',
          '@env',
          '@request',
          '@response',
          '@params',
          '@_response_buffer',
          '@route',
          '@block_params',
          '@_content_type',
          '@current_ability',
          '@block_params',
          '@layout'
        ]

        user_ivs = []
        self.instance_variables.to_s.gsub(/(\[|\]|:)/, '').split(', ').each do |key|
          user_ivs << key if not ignored_ivs.include? key
        end
        locals = {}
        user_ivs.each do |iv|
          locals[iv[1..-1]] = self.instance_variable_get iv
        end

        super engine, data, options, locals, &block
      end
    end
    def self.registered(app)
      app.helpers Helpers
    end
  end
end