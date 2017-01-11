#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

connection = Bunny.new
connection.start

channel = connection.create_channel

q  = channel.queue("hello")

20.times do
  channel.default_exchange.publish("Hello World!", :routing_key => q.name)
end

puts " [x] Sent 20 x 'Hello World!'"

connection.close
