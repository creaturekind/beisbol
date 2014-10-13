require 'mysql2'
require 'io/console'
require_relative './lib/player'

con = Mysql2::Client.new(:host => "localhost", :username => "beisbol", 
		:password => "test")

#print "player: "
player_id = "aaronha01"#.gets.chomp

#print "year: "
year_beg = "1959"#.gets.chomp
year_end = "1964"#.gets.chomp

player = Player.new(player_id)
puts player.pid
puts player.weight
