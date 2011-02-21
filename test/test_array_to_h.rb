require 'helper'

class TestArrayIndex < Test::Unit::TestCase

  context "Arrays" do

    should "have an to_h method converting key-value pairs to a hash" do
      assert_respond_to [], :to_h
      assert_equal({}, [].to_h)
      assert_equal({:a=>11, :b=>22}, [[:a,11], [:b,22]].to_h)
      assert_equal({:a=>11, :b=>[22,33]}, [[:a,11], [:b,22,33]].to_h)
      assert_equal({1=>nil, 2=>nil, 3=>nil}, [1,2,3].to_h)
    end

  end

end