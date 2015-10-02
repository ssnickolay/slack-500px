require 'oauth'
require 'multi_json'
require_relative 'response/base'
require_relative 'response/popular'

module Slack500px
  class Finder
    RESERVED_TEXT = {
      'popular' => Slack500px::Response::Popular
    }

    def initialize(text, _)
      binding.pry

      access_token = get_access_token

      p MultiJson.decode(access_token.get('/v1/users.json').body).inspect
    end

    def perform

    end
  end
end