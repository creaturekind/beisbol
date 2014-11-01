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
year_beg = "1959"#.gets.chomp
year_end = "1964"#.gets.chomp

player = Player.new(con, player_id)
puts player.name_first + " " + player.name_last + " - Average:"
avg = Average.new(con, player)
avg.find_avg
print ("\n")
puts player.name_first + " " + player.name_last + " - OBP:"
obp = Obp.new(con, player)
obp.find_obp
