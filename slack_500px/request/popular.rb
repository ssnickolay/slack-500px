module Slack500px
  module Request
    class Popular < Base
      private

      def build_url(params)
        'https://api.500px.com/v1/photos?feature=popular&sort=%{sort}&rpp=%{rpp}&image_size=4&page=%{page}' % params
      end
    end
  end
end
