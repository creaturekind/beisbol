require 'mysql2'
require 'io/console'
require_relative 'lib/batting.rb'

print "Password: "
pass = STDIN.noecho(&:gets).chomp

client = Mysql2::Client.new(:host => "localhost", :username => "joseph", 
		:password => pass)
result = client.query("select H from bdb.Batting 
    where playerID = 'aaronha01' and yearID = '1959'", 
		:symbolize_keys => true)

puts result.count
result.each do |row|
	puts row[:H]
end
