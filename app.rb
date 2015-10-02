# {"token"=>"yMVmbbQEEMiJwBV6GKFGDxMg", "team_id"=>"T04FJ1H98", "team_domain"=>"runtimellc", "service_id"=>"11785034693", "channel_id"=>"C04FJ1HGN", "channel_name"=>"random", "timestamp"=>"1443805897.000302", "user_id"=>"U04FJ82JU", "user_name"=>"ssnickolay", "text"=>"cat привет", "trigger_word"=>"cat"}
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
