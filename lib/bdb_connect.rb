require 'mysql2'

def bdb_connect
  Mysql2::Client.new(:host => "localhost", :username => "beisbol", 
      :password => "test")
end
