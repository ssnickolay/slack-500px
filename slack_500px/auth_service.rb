# https://github.com/500px/api-documentation/blob/master/examples/Ruby/xauth.rb
module Slack500px
  class AuthService
    BASE_URL = 'https://api.500px.com'

    class << self
      def perform
        consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], auth_params)

        request_token = consumer.get_request_token()
        consumer.get_access_token(request_token, {}, {
          x_auth_mode: 'client_auth',
          x_auth_username: ENV['USERNAME'],
          x_auth_password: ENV['PASSWORD']
        })
      end

      private

      def auth_params
        {
          site: BASE_URL,
          request_token_path: '/v1/oauth/request_token',
          access_token_path: '/v1/oauth/access_token',
          authorize_path: '/v1/oauth/authorize'
        }
      end
    end
  end
end
