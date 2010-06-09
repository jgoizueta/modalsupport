require 'helper'

class TestStateEquivalent < Test::Unit::TestCase

  context "Mixing-in StateEquivalent" do
    
    class TestClass
      def initialize(v, w)
        @value1 = v
        @value2 = w
      end
      attr_reader :value1, :value2
      include ModalSupport::StateEquivalent
    end

    should "provide equality" do
      assert_equal TestClass.new(11,22), TestClass.new(11,22)
      assert_equal TestClass.new(11,nil), TestClass.new(11,nil)
      assert_not_equal TestClass.new(11,22), TestClass.new(11,23)
      assert_not_equal TestClass.new(11,22), 11
      assert TestClass.new(11,22).eql?(TestClass.new(11,22))
      assert TestClass.new(11,nil).eql?(TestClass.new(11,nil))
      assert !TestClass.new(11,22).eql?(TestClass.new(11,23))
      assert !TestClass.new(11,22).eql?(11)
    end
    
    should "provide hash consistent with equality" do
      assert_equal TestClass.new(11,22).hash, TestClass.new(11,22).hash
      assert_equal TestClass.new(11,nil).hash, TestClass.new(11,nil).hash
      assert_not_equal TestClass.new(11,22).hash, TestClass.new(11,23).hash
    end
    
  end

end