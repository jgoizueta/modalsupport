require 'helper'

class TestParalellEach < Test::Unit::TestCase

  context "Enumerable objects" do

    should "have a multiple paralell iterator" do
      assert_equal [[1, :a, 10], [2, :b, 11], [3, :c, 12]],
                   (1..3).paralell_each([:a,:b,:c],(10..12)).to_a 
    end

    should "have a multiple paralell combination" do
      assert_equal [[1, :a, 10], [2, :b, 11], [3, :c, 12]],
                   (1..3).paralell_array([:a,:b,:c],(10..12))
    end
    
    should "enumerate in parallel getting nils when an iterator runs out sooner that others" do
      assert_equal [[1, :a, 10], [2, :b, 11], [3, nil, 12]],
                   (1..3).paralell_array([:a,:b],(10..12))
      assert_equal [[1, :a, 10], [2, :b, 11], [3, nil, nil]],
                   (1..3).paralell_array([:a,:b],(10..11))
    end
    
  end

end