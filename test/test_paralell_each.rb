require 'helper'

class TestParalellEach < Test::Unit::TestCase

  context "Enumerable objects" do

    should "have a multiple paralell iterator" do
      assert_equal [[1, :a, 10], [2, :b, 11], [3, :c, 12]],
                   (1..3).paralell_each([:a,:b,:c],(10..12)).to_a 
    end
    
  end

end