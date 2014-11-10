module Average
  def initialize(player)
=begin
    @avg_query = "select yearID, (H/AB) as avg from bdb.Batting where 
        playerID = '#{player.player_id}' and yearID between 
        year(str_to_date('#{player.debut}', '%m/%d/%Y')) and 
        year(str_to_date('#{player.final_game}', '%m/%d/%Y'))"
    @avg_result = connection.query(@avg_query, :symbolize_keys => true)
=end
  end
  def find_avg
    player.basebal.each do |row|
      printf("#{row[:yearID]}: %-.3f\n", row[:avg].to_f)
    end
  end
end
