module Slack500px
  module Request
    class Search < Base
      private

      def build_url
        URI.escape('https://api.500px.com/v1/photos/search?tag=%{tag}&sort=%{sort}&rpp=1&image_size=4&page=%{page}' % params)
      end

      def params
        super.merge(tag: @query)
      end
    end
  end
end
