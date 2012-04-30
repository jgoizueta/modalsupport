require 'helper'

class TestRest < Test::Unit::TestCase

  context 'Enumerable#rest' do

    should "returns the rest of elements having removed the first one" do
      assert_equal [2,3,4,5], [1,2,3,4,5].rest
      assert_equal [2], [1,2].rest
      assert_equal [], [1].rest
      assert_equal [], [].rest
    end

  end

end
