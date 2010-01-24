require 'helper'

class TestMatch < Test::Unit::TestCase

  should "pass match info to a block and use result for substitution" do
    assert_equal "xxx AXA yue asx AYA AZA", "xxx axa yue asx aya aza".gsub_each(/a.a/){|match| match.to_s.upcase}
  end

  should "not modify the string" do
    str = "xxx axa yue asx aya aza"
    str.gsub_each(/a.a/){|match| match.to_s.upcase}
    assert_equal "xxx axa yue asx aya aza", str
  end

  should "have a mutating version" do
    str = "xxx axa yue asx aya aza"
    str.gsub_each!(/a.a/){|match| match.to_s.upcase}
    assert_equal "xxx AXA yue asx AYA AZA", str
  end
  
end