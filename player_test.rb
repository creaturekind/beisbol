require 'mysql2'
require 'io/console'
require_relative './lib/bdb_connect'
require_relative './lib/player'

con = bdb_connect

#print "player: "
player_id = "aaronha01"#.gets.chomp

#print "year: "
year_beg = "1959"#.gets.chomp
year_end = "1964"#.gets.chomp

player = Player.new(con, player_id)
puts player.player_id
puts player.weight
#A Change!
