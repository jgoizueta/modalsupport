require 'helper'

class TestBracketConstructor < Test::Unit::TestCase

  context "Mixing-in BracketConstructor" do
    
    class TestClass
      def initialize(v)
        @value = v
      end
      attr_reader :value
      include ModalSupport::BracketConstructor
    end

    should "preserve nils" do
      assert_nil TestClass[nil]
    end
    
    should "preserve objects of the class" do
      x = TestClass.new(10)
      # assert_equal x.value, TestClass[x].value
      assert_equal x.object_id, TestClass[x].object_id
    end
    
    should "create new object" do
      assert_equal 11, TestClass[11].value
    end
    
  end

end