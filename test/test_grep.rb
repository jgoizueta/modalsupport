require 'helper'

class TestGrep < Test::Unit::TestCase

  context "Applying grep_each to an array" do

    should "pass match info to a block" do
      assert_equal %w{AXA AYA AZA}, %w{xxx axa yue asx aya aza}.grep_each(/a.a/){|match| match.to_s.upcase}
    end

    should "not modify the array" do
      str = %w{xxx axa yue asx aya aza}
      str.grep_each(/a.a/){|match| match.to_s.upcase}
      assert_equal %w{xxx axa yue asx aya aza}, str
    end
    
  end

end