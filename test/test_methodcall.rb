require 'helper'

class TestMethodcall < Test::Unit::TestCase

  context "Given a non-nil object" do

    should "Return itself from ._?" do
      assert_same 3, 3._?
      o = "xxx"
      assert_same o, o._?
      o = Object.new
      assert_same o, o._?
      o = false
      assert_same o, o._?
      o = 0
      assert_same o, o._?
    end

  end

  context "Given a nil object" do

    should "Return something that returns nil to any message" do

      assert_nil nil._?.to_s
      assert_nil nil._?.inspect
      assert_nil nil._?.xxxx

    end

  end


end
