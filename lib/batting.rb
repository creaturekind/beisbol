require_relative './avg'

module Batting
  #include Average
  attr_reader :year_id, :beisbol_id, :player_id, :manager_id, :hof_id, 
      :birth_year, :birth_month, :birth_day, :name_first, :name_last, 
      :name_note, :name_given, :name_nick, :weight, :height, :bats, 
      :throws, :debut, :final_game, :college
  def initialize(player)
    @year_id = []
    @stint = []
    @team_id = []
    @lg_id = []
    @g = []
    @g_batting = []
    @ab = []
    @r = []
    @h = []
    @doubles = []
    @triples = []
    @hr = []
    @rbi = []
    @sb = []
    @cd = []
    @bb = []
    @so = []
    @ibb = []
    @hbp = []
    @sh = []
    @sf = []
    @gidp = []
    @g_old = []
    
    @batting_query = "select yearID, stint, teamID, lgID, G, G_batting,
        AB, R, H, 2B as doubles, 3B as triples, HR, RBI, SB, CD, BB, SO, IBB, HBP, SH, SF, 
        GIDP, G_old from bdb.Master where playerID = '#{player.player_id}'"
    @batting_result = sql_con.query(@batting_query, :symbolize_keys => true)
  end
  @batting_result.each do |row|
    @year_id.push row[:yearID]
    @stint.push row[:stint]
    @team_id.push row[:teamID]
    @lg_id.push row[:lgID]
    @g.push row[:G]
    @g_batting.push row[:G_batting]
    @ab.push row[:AB]
    @r.push row[:R]
    @h.push row[:H]
    @doubles.push row[:doubles]
    @triples.push row[:triples]
    @hr.push row[:HR]
    @rbi.push row[:RBI]
    @sb.push row[:SB]
    @cd.push row[:CD]
    @bb.push row[:BB]
    @so.push row[:SO]
    @ibb.push row[:IBB]
    @hbp.push row[:HBP]
    @sh.push row[:SH]
    @sf.push row[:SF]
    @gidp.push row[:GIDP]
    @g_old.push row[:G_old]
  end
end
