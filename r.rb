#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

connection = Bunny.new(:automatically_recover => false)
connection.start

channle = connection.create_channel
queue = channle.queue("hello")

begin
  puts " [*] Waiting for messages. To exit press CTRL+C"
  queue.subscribe(:block => true) do |delivery_info, properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  connection.close
  exit(0)
end
