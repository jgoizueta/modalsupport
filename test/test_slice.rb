require 'helper'

class TestSlice < Test::Unit::TestCase

  context "Enumerable objects" do
  
    should "have each_slice" do
      assert [].respond_to?(:each_slice)
      assert({}.respond_to?(:each_slice))
    end

    should "iterate into disjoint groups with each_slice" do
      a = (1..8).to_a
    
      slices = []
      a.each_slice(2){|s| slices << s}
      assert_equal [[1,2],[3,4],[5,6],[7,8]], slices
    
      slices = []
      a.each_slice(3){|s| slices << s}
      assert_equal [[1,2,3],[4,5,6],[7,8]], slices
    end

    should "convert each_slice to an array" do
      assert_equal [[1,2],[3,4],[5,6],[7,8]], [1,2,3,4,5,6,7,8].each_slice(2).to_a
      assert_equal [[1,2,3],[4,5,6],[7,8]], [1,2,3,4,5,6,7,8].each_slice(3).to_a    
    end
  
    should "have each_pair" do
      assert_equal [[1,2],[3,4],[5,6],[7,8]], [1,2,3,4,5,6,7,8].each_pair.to_a
    end

    should "have to_pairs" do
      assert [].respond_to?(:to_pairs)
      assert({}.respond_to?(:to_pairs))
      assert_equal [[1,2],[3,4],[5,6],[7,8]], [1,2,3,4,5,6,7,8].to_pairs
      assert_equal [[1,2],[3,4],[5,6],[7]], [1,2,3,4,5,6,7].to_pairs
    end
    
  end

end