require 'oauth'
require 'multi_json'
require_relative 'auth_service'
require_relative 'request/base'
require_relative 'request/popular'

module Slack500px
  class Finder
    RESERVED_TEXT = {
      'popular' => Slack500px::Request::Popular
    }

    def initialize(query, _)
      @request = Slack500px::Request::Popular.new(query)
    end

    def perform
      @request.perform
    end
  end
end
