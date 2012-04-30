require 'helper'

class TestMapWithIndex< Test::Unit::TestCase

  context 'Enumerable#map_with_index' do

    should "maps elements passing also de index to the block" do
      assert_equal ["", "short", "wordswords"], %w(some short words).map_with_index { |s, i| s * i }
    end

  end

end
