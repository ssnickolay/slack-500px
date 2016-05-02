module Slack500px
  module Request
    class Search < Base
      private

      def build_url(params)
        URI.escape('https://api.500px.com/v1/photos/search?term=%{tag}&sort=%{sort}&rpp=%{rpp}&image_size=4&page=%{page}' % params)
      end

      def base_params(start_page = nil)
        super.merge(tag: @query)
      end
    end
  end
end
