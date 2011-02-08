require 'helper'

class TestRotate < Test::Unit::TestCase

  context "Arrays" do

    should "have a proper rotate method" do
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate(1)
      assert_equal [3,4,5,6,7,1,2], [1,2,3,4,5,6,7].rotate(2)
      assert_equal [4,5,6,7,1,2,3], [1,2,3,4,5,6,7].rotate(3)
      assert_equal [5,6,7,1,2,3,4], [1,2,3,4,5,6,7].rotate(4)
      assert_equal [6,7,1,2,3,4,5], [1,2,3,4,5,6,7].rotate(5)
      assert_equal [7,1,2,3,4,5,6], [1,2,3,4,5,6,7].rotate(6)
      assert_equal [1,2,3,4,5,6,7], [1,2,3,4,5,6,7].rotate(7)
      assert_equal [1,2,3,4,5,6,7], [1,2,3,4,5,6,7].rotate(0)
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate(8)
      assert_equal [7,1,2,3,4,5,6], [1,2,3,4,5,6,7].rotate(-1)
      assert_equal [6,7,1,2,3,4,5], [1,2,3,4,5,6,7].rotate(-2)
      assert_equal [5,6,7,1,2,3,4], [1,2,3,4,5,6,7].rotate(-3)
      assert_equal [4,5,6,7,1,2,3], [1,2,3,4,5,6,7].rotate(-4)
      assert_equal [3,4,5,6,7,1,2], [1,2,3,4,5,6,7].rotate(-5)
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate(-6)
      assert_equal [1,2,3,4,5,6,7], [1,2,3,4,5,6,7].rotate(-7)
      assert_equal [7,1,2,3,4,5,6], [1,2,3,4,5,6,7].rotate(-8)
      assert_equal [3,4,5,6,7,1,2], [1,2,3,4,5,6,7].rotate(23)
      assert_equal [6,7,1,2,3,4,5], [1,2,3,4,5,6,7].rotate(-23)
    end

    should "not be muted by rotate" do
      a = [1,2,3,4,5,6,7]
      a.rotate(3)
      assert_equal [1,2,3,4,5,6,7], a
      a.rotate(-3)
      assert_equal [1,2,3,4,5,6,7], a
    end
    
    should "have a proper rotate! method" do
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate!
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate!(1)
      assert_equal [3,4,5,6,7,1,2], [1,2,3,4,5,6,7].rotate!(2)
      assert_equal [4,5,6,7,1,2,3], [1,2,3,4,5,6,7].rotate!(3)
      assert_equal [5,6,7,1,2,3,4], [1,2,3,4,5,6,7].rotate!(4)
      assert_equal [6,7,1,2,3,4,5], [1,2,3,4,5,6,7].rotate!(5)
      assert_equal [7,1,2,3,4,5,6], [1,2,3,4,5,6,7].rotate!(6)
      assert_equal [1,2,3,4,5,6,7], [1,2,3,4,5,6,7].rotate!(7)
      assert_equal [1,2,3,4,5,6,7], [1,2,3,4,5,6,7].rotate!(0)
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate!(8)
      assert_equal [7,1,2,3,4,5,6], [1,2,3,4,5,6,7].rotate!(-1)
      assert_equal [6,7,1,2,3,4,5], [1,2,3,4,5,6,7].rotate!(-2)
      assert_equal [5,6,7,1,2,3,4], [1,2,3,4,5,6,7].rotate!(-3)
      assert_equal [4,5,6,7,1,2,3], [1,2,3,4,5,6,7].rotate!(-4)
      assert_equal [3,4,5,6,7,1,2], [1,2,3,4,5,6,7].rotate!(-5)
      assert_equal [2,3,4,5,6,7,1], [1,2,3,4,5,6,7].rotate!(-6)
      assert_equal [1,2,3,4,5,6,7], [1,2,3,4,5,6,7].rotate!(-7)
      assert_equal [7,1,2,3,4,5,6], [1,2,3,4,5,6,7].rotate!(-8)
      assert_equal [3,4,5,6,7,1,2], [1,2,3,4,5,6,7].rotate!(23)
      assert_equal [6,7,1,2,3,4,5], [1,2,3,4,5,6,7].rotate!(-23)
    end

    should "be muted by rotate" do
      a = [1,2,3,4,5,6,7]
      a.rotate!(3)
      assert_equal [4,5,6,7,1,2,3], a
      a = [1,2,3,4,5,6,7]
      a.rotate!(-3)
      assert_equal [5,6,7,1,2,3,4], a
    end

  end

end