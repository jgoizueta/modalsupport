require 'helper'

class TestMapHash< Test::Unit::TestCase

  context 'Enumerable#map_hash' do

    should "returns a hash where keys are the enumerated elements and the values are given by the block" do
      assert_equal({'some'=>4, 'words'=>5, 'short'=>nil}, %w(some short words).map_hash { |s| s.length unless s == "short" })
      assert_equal({1=>3, 2=>6, 3=>9}, (1..3).map_hash{|v| v*3})
    end

  end

  context 'Hash#map_hash' do

    should "applies a function with the key and value as arguments to each value of the hash" do
      assert_equal({1=>true, 3=>true, 6=>false}, {1=>2, 3=>4, 6=>5}.map_hash { |key, value| key < value })
      assert_equal({1=>3, 2=>6, 3=>9}, (1..3).map_hash{|v| v*3})
    end

    should "applies a function with the value as arguments to each value of the hash" do
      assert_equal({1=>true, 3=>true, 6=>false}, {1=>2, 3=>4, 6=>5}.map_hash { |key, value| key < value })
      assert_equal({1=>200, 3=>400, 6=>500 }, {1=>2, 3=>4, 6=>5}.map_hash { |value| value * 100 })
    end

  end


end
