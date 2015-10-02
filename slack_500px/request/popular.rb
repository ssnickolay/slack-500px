module Slack500px
  module Request
    class Popular < Base
      def perform
        response = MultiJson.decode(@auth.get(build_url).body)
        if response['photos'].any?
          response['photos'][0]['image_url']
        else
          ENV['DEFAULT_ANSWER']
        end
      end

      private

      def build_url
        'https://api.500px.com/v1/photos?feature=popular&sort=%{sort}&rpp=1&image_size=4&page=%{page}' % params
      end
    end
  end
end
