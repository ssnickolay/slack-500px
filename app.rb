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
    on 'search', param('query') do |query|
      res.headers['Content-Type'] = 'application/json; charset=utf-8'
      res.write({text: Slack500px::Finder.perform(query)}.to_json)
    end

    # Request example:
    # => {"team_domain"=>"runtimellc", channel_name"=>"general", "timestamp"=>"1445007178.000010", "text"=>"500px cat", "trigger_word"=>"500px"}
    on 'for_slack', param('text'), param('trigger_word') do |query, trigger_word|
      res.headers['Content-Type'] = 'application/json; charset=utf-8'
      query = query.gsub("#{ trigger_word } ", '')
      puts query
      res.write({text: Slack500px::Finder.perform(query)}.to_json)
    end
  end
end

