require 'rubygems'
require 'cuba'
require 'json'
require 'pry'
require 'dotenv'

Dotenv.load

require_relative 'slack_500px/finder'

Cuba.define do
  on root do
    res.write('Runtime for slack!')
  end

  on get do
    on 'search', param('query') do |query|
      res.write("<img src='#{ Slack500px::Finder.perform(query) }'/>")
    end

    on 'inspiration' do
      res.write("<img src='#{ Slack500px::Finder.perform('inspiration')}'/>")
    end
  end

  on post do
    on 'search', param('text') do |query|
      res.headers['Content-Type'] = 'application/json; charset=utf-8'
      res.write({text: Slack500px::Finder.perform(query)}.to_json)
    end
  end
end
