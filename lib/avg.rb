require 'mysql2'
#require_relative './player'

class Average #< Player 
  def initialize(player)
    @client = Mysql2::Client.new(:host => "localhost", 
        :username => "beisbol", :password => "test")
    @avg_query = "select yearID, (H/AB) as avg from bdb.Batting where 
        playerID = '#{player.pid}' and yearID between 
        year(str_to_date('#{player.debut}', '%m/%d/%Y')) and 
        year(str_to_date('#{player.final_game}', '%m/%d/%Y'))"
    @avg_result = @client.query(@avg_query, :symbolize_keys => true)
  end
  def find_avg
    @avg_result.each do |row|
      printf("#{row[:yearID]}: %-.3f\n", row[:avg].to_f)
    end
  end
end
