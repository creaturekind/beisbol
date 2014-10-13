require 'mysql2'
#require_relative './avg'

class Player
  attr_reader :pid, :beisbol_id, :player_id, :manager_id, :hof_id, 
      :birth_year, :birth_month, :birth_day, :name_first, :name_last, 
      :name_note, :name_given, :name_nick, :weight, :height, :bats, 
      :throws, :debut, :final_game, :college
  def initialize(player_id)
    @pid = player_id
    @client = Mysql2::Client.new(:host => "localhost", 
        :username => "beisbol", :password => "test")
    @player_query = "select lahmanID, playerID, managerID, hofID, 
        birthYear, birthMonth, birthDay, nameFirst, nameLast, nameNote,
        nameGiven, nameNick, weight, height, bats, throws, debut,
        finalGame, college from bdb.Master where playerID = '#{player_id}'"
    @player_result = @client.query(@player_query, :symbolize_keys => true)
    
    @player_result.each do |row|
      @beisbol_id = row[:lahmanID]
      @player_id = row[:playerID]
      @manager_id = row[:managerID]
      @hof_id = row[:hofID]
      @birth_year = row[:birthYear]
      @birth_month = row[:birthMonth]
      @birth_day = row[:birthDay]
      @name_first = row[:nameFirst]
      @name_last = row[:nameLast]
      @name_note = row[:nameNote]
      @name_given = row[:nameGiven]
      @name_nick = row[:nameNick]
      @weight = row[:weight]
      @height = row[:height]
      @bats = row[:bats]
      @throws = row[:throws]
      @debut = row[:debut]
      @final_game = row[:finalGame]
      @college = row[:college]
    end
  end
  def info
    @player_result.each do |row|
      puts row
    end
  end
end
