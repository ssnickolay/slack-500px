require 'oauth'
require 'multi_json'

module Slack500px
  module Request
    class Base
      class NotFound < StandardError; end

      RPP = 100
      SORTS = %w(votes_count rating times_viewed favorites_count comments_count)

      def initialize(query)
        @query = query
        @auth = AuthService.perform
      end

      def perform
        url = build_url(base_params)
        puts url
        response = MultiJson.decode(@auth.get(url).body)
        if response['photos'] && response['photos'].any?
          response['photos'].sample['image_url']
        else
          ENV['DEFAULT_ANSWER']
        end
      rescue NotFound
        ENV['DEFAULT_ANSWER']
      end

      private

      def base_params(start_page = nil)
        {
          sort: sort,
          page: start_page || random_page,
          rpp: RPP
        }
      end

      def random_page
        max_pages_count = page_counts
        if max_pages_count.nil? || max_pages_count.zero?
          raise NotFound
        else
          Random.rand(page_counts)
        end
      end

      def page_counts
        response = MultiJson.decode(@auth.get(build_url(base_params(1))).body)
        response['total_pages']
      end

      def sort
        SORTS.sample
      end
    end
  end
end
