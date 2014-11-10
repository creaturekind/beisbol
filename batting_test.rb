require 'mysql2'
require 'io/console'
require_relative './lib/player'
require_relative './lib/avg'
require_relative './lib/obp'
require_relative './lib/bdb_connect'

con = bdb_connect

#print "player: "
player_id = "aaronha01"#.gets.chomp

#print "year: "

player = Player.new(con, player_id)
puts player.name_first + " " + player.name_last + " - Hits:"
player.batting(player)

print ("\n")
puts player.name_first + " " + player.name_last + " - OBP:"
obp = Obp.new(con, player)
obp.find_obp

