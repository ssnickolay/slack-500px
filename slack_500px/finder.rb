require 'oauth'
require 'multi_json'
require_relative 'auth_service'
require_relative 'request/base'
require_relative 'request/popular'
require_relative 'request/black_and_white'
require_relative 'request/search'

module Slack500px
  class Finder
    RESERVED = {
      'popular' => Slack500px::Request::Popular,
      'black_and_white' => Slack500px::Request::BlackAndWhite
    }

    def initialize(query, _)
      @query = query
      @request_class = RESERVED[query] || Slack500px::Request::Search
    end

    def perform
      p "USE #{ @request_class }"
      @request_class.new(@query).perform
    end
  end
end
