require 'helper'

class TestMatch < Test::Unit::TestCase

  context "Applying match_one to a string or regular expression" do

    should "pass match info to a block and return the block result" do
      assert_equal "axa", "xxx axa yue asx aya aza".match_one(/a.a/){|match| match.to_s}
      assert_equal "axa", /a.a/.match_one("xxx axa yue asx aya aza"){|match| match.to_s}
    end

    should "return nil if no match" do
      assert_equal "axa", "xxx axa yue asx aya aza".match_one(/a.a/){|match| match.to_s}
      assert_equal "axa", /a.a/.match_one("xxx axa yue asx aya aza"){|match| match.to_s}
      assert_nil "xxx axa yue asx aya aza".match_one(/b.b/){|match| match.to_s}
      assert_nil /b.b/.match_one("xxx axa yue asx aya aza"){|match| match.to_s}
    end
    
  end

  context "Applying match_all to a string or regular expression" do
    
    should "map all matches to an array" do
      assert_equal ["axa", "aya", "aza"], "xxx axa yue asx aya aza".match_all(/a.a/){|match| match.to_s}
      assert_equal ["axa", "aya", "aza"], /a.a/.match_all("xxx axa yue asx aya aza"){|match| match.to_s}
    end
  
  end
  
end