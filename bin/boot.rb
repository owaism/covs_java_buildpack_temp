#!/usr/bin/env ruby

value = "-"

ENV.each{|name, value1|
				value = value + "#{name} - #{value1},"
			}

value = value + "-"

puts "echo '#{value}'"
