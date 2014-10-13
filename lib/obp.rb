require 'mysql2'
#require_relative './player'

class Obp #< Player 
  def initialize(player)
    @client = Mysql2::Client.new(:host => "localhost", 
        :username => "beisbol", :password => "test")
    @obp_query = "select yearID, ((H + BB + HBP) / (AB + BB + HBP + SF)) 
        as obp from bdb.Batting where playerID = '#{player.pid}' and 
        yearID between year(str_to_date('#{player.debut}', '%m/%d/%Y')) 
        and year(str_to_date('#{player.final_game}', '%m/%d/%Y'))"
    puts @obp_query
    @obp_result = @client.query(@obp_query, :symbolize_keys => true)
  end
  def find_obp
    @obp_result.each do |row|
      printf("#{row[:yearID]}: %-.3f\n", row[:obp].to_f)
    end
  end
end
