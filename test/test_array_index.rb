require 'helper'

class TestArrayIndex < Test::Unit::TestCase

  context "Arrays" do

    should "have an index method with no parameters accepting a block" do
      assert_equal 3, [1,2,3,4,5,6,7].index{|x| x>3}
      assert_equal nil, [1,2,3,4,5,6,7].index{|x| x>7}
    end

    should "also have an index method with parameters" do
      assert_equal 3, [1,2,3,4,5,6,7].index(4)
      assert_equal nil, [1,2,3,4,5,6,7].index(8)
    end

  end

end