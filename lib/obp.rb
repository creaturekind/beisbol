require 'date'

class Obp #< Player 
  def initialize(connection, player)
    debut = Date.strptime(player.debut, '%m/%d/%Y')
    final_game = Date.strptime(player.final_game, '%m/%d/%Y')
    @obp_query = "select yearID, ((H + BB + HBP) / (AB + BB + HBP + SF))  
        as obp from bdb.Batting where playerID = '#{player.player_id}' 
        and yearID between #{debut.year} and #{final_game.year}"
        # and (AB + BB + HBP + SH + SF)/G >= 3.1)"
    @obp_result = connection.query(@obp_query, :symbolize_keys => true)
  end
  def find_obp
    @obp_result.each do |row|
      printf("#{row[:yearID]}: %-.3f\n", row[:obp].to_f)
    end
  end
end
