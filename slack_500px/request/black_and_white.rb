module Slack500px
  module Request
    class BlackAndWhite < Base
      private

      def build_url
        'https://api.500px.com/v1/photos?feature=popular&sort=%{sort}&rpp=1&image_size=4&page=%{page}&only=Black+and+White' % params
      end
    end
  end
end
