require_relative "../lib/player"

describe Player do
  it "must be created with a string"
    Player.new("string").must_be_instance_of Player
  end

  it "cannot be created with no variable"
    proc {Player.new}.must_raise ArgumentError
  end
  
  it "must be able to return an average"
    Player.avg("aaronha01").must_equal true
  end
end
