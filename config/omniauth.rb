module OmniAuth
  module Strategies
    class Template < OmniAuth::Strategies::OAuth2
      option :name, :template

      option :client_options, {
        :site => 'http://api.template.com',
        :authorize_path => "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          :username => raw_info["username"],
          :first_name => raw_info["first_name"],
          :last_name => raw_info["last_name"],
          :type => raw_info["type"],
          :auth_level => raw_info["auth_level"],
          :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1/me.json').parsed
      end
    end
  end
end