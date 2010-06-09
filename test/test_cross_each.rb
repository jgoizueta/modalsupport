require 'helper'

class TestCrossEach < Test::Unit::TestCase

  context "Enumerable objects" do

    should "have a multiple cross-product iterator" do
      assert_equal [[1, :a, 11], [1, :a, 12], [1, :b, 11], [1, :b, 12], [1, :c, 11], [1, :c, 12],
                    [2, :a, 11], [2, :a, 12], [2, :b, 11], [2, :b, 12], [2, :c, 11], [2, :c, 12],
                    [3, :a, 11], [3, :a, 12], [3, :b, 11], [3, :b, 12], [3, :c, 11], [3, :c, 12],
                    [4, :a, 11], [4, :a, 12], [4, :b, 11], [4, :b, 12], [4, :c, 11], [4, :c, 12]],
                    (1..4).cross_each([:a,:b,:c],(11..12)).to_a
    end
    
  end

end