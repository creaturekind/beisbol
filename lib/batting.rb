require_relative './lib/player'

class Batting #< Player
  def initialize(sql_con, player)
    @batting_query = "select yearID, stint, teamID, lgID, G, G_batting,
        AB, R, H, 2B, 3B, HR, RBI, SB, CD, BB, SO, IBB, HBP, SH, SF, 
        GIDP, G_old from bdb.Master where playerID = '#{player.player_id}'"
    @batting_result = sql_con.query(@player_query, :symbolize_keys => true)
  end
  @batting_result.each do |row|
    @year_id = row[:yearID]
    @stint = row[:stint]
    @team_id = row[:teamID]
    @lg_id = row[:lgID]
    @g = row[:G]
    @g_batting = row[:G_batting]
    @ab = row[:AB]
    @r = row[:R]
    @h = row[:H]
    @2b = row[:2B]
    @3b = row[:3B]
    @hr = row[:HR]
    @rbi = row[:RBI]
    @sb = row[:SB]
    @cd = row[:CD]
    @bb = row[:BB]
    @so = row[:SO]
    @ibb = row[:IBB]
    @hbp = row[:HBP]
    @sh = row[:SH]
    @sf = row[:SF]
    @gidp = row[:GIDP]
    @g_old = row[:G_old]
  end
end
