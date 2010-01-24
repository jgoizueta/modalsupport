require 'helper'

class TestGsub < Test::Unit::TestCase

  should "pass match info to a block" do
    assert_equal "axa", "xxx axa yue asx aya aza".match_one(/a.a/){|match| match.to_s}
    assert_equal "axa", /a.a/.match_one("xxx axa yue asx aya aza"){|match| match.to_s}
  end

  should "map all matches to an array" do
    assert_equal ["axa", "aya", "aza"], "xxx axa yue asx aya aza".match_all(/a.a/){|match| match.to_s}
    assert_equal ["axa", "aya", "aza"], /a.a/.match_all("xxx axa yue asx aya aza"){|match| match.to_s}
  end
  
end