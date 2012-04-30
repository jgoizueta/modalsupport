require 'helper'

class TestBuildHash < Test::Unit::TestCase

  context 'Enumerable#build_hash' do

    should "returns a hash where each element is given by the block unless nil" do
      assert_equal({'some'=>4, 'words'=>5}, %w(some short words).build_hash { |s| [s, s.length] unless s == "short" })
      assert_equal({10=>3, 20=>6, 30=>9}, (1..3).build_hash{|v| [v*10,v*3]})
    end

  end

end
