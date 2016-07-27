require 'oauth'
require 'multi_json'
require_relative 'auth_service'
require_relative 'request/base'
require_relative 'request/popular'
require_relative 'request/black_and_white'
require_relative 'request/search'

module Slack500px
  class Finder
    DEFAULT_IMAGE = 'http://i33.carguru.ru/89/34/93489/51/2052951/969292396ene.gif'
    RESERVED = {
      'popular' => Slack500px::Request::Popular,
      'black_and_white' => Slack500px::Request::BlackAndWhite,
    }

    class << self
      def perform(query)
        begin
          request_class = find_request(query)
          p "USE #{ request_class }"

          request_class.new(query).perform
        rescue Errno::EHOSTUNREACH
          DEFAULT_IMAGE
        end  
      end

      private

      def find_request(query)
        if query == 'inspiration'
          RESERVED.values.sample
        elsif RESERVED.has_key?(query)
          RESERVED[query]
        else
          Slack500px::Request::Search
        end
      end
    end
  end
end
