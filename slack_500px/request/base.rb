require 'oauth'
require 'multi_json'

module Slack500px
  module Request
    class Base
      SORTS = %w(votes_count rating times_viewed favorites_count comments_count)

      def initialize(query)
        @query = query
        @auth = AuthService.perform
      end

      def perform
        response = MultiJson.decode(@auth.get(build_url).body)
        if response['photos'].any?
          response['photos'][0]['image_url']
        else
          ENV['DEFAULT_ANSWER']
        end
      end

      private

      def params
        {
          sort: sort,
          page: page
        }
      end

      def page
        Random.rand(1000)
      end

      def sort
        SORTS.sample
      end
    end
  end
end
