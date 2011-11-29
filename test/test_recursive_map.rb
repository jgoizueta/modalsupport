require 'helper'

class TestRecursiveMap < Test::Unit::TestCase

  context "recursive_map" do
    
    setup do
      require 'yaml'
      @value_doubler = lambda{|v| v.kind_of?(Numeric) ? v*2 : v}
      @hash_to_array = lambda{|v| v.kind_of?(Hash) ? v.to_a : v}
      @array_to_string = lambda{|v| v.kind_of?(Array) ? v.inspect : v}
      @string_to_cont_and_double = lambda{|v|
        case v
        when String
          YAML.load(v)
        when Numeric
          v*2
        else
          v
        end
      }
    end
    
    should "process values in containers" do
      assert_equal( 
        {:a=>22, :b=>44},
        ModalSupport.recursive_map(:a=>11, :b=>22, &@value_doubler)
      )
      assert_equal( 
        [22,44],
        ModalSupport.recursive_map([11,22], &@value_doubler)
      )
    end

    should "process values in nested containers" do
      assert_equal( 
        {:a=>22, :b=>44, :c=>{:x=>200,:y=>400}, :d=>[2,4,6]},
        ModalSupport.recursive_map(:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3], &@value_doubler)
      )
      assert_equal( 
        [22, 44, {:c=>{:x=>200,:y=>400}, :d=>[2,4,6]}],
        ModalSupport.recursive_map([11, 22, {:c=>{:x=>100,:y=>200}, :d=>[1,2,3]}], &@value_doubler)
      )
    end

    should "process values in deeply nested containers" do
      assert_equal( 
        {:a=>22, :b=>44, :c=>{:x=>200, :y=>400}, :d=>[2, 4, 6, {:zz=>[2000, 4000, {:yy=>{:xx=>6000}}]}]},
        ModalSupport.recursive_map({:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3,{:zz=>[1000,2000,{:yy=>{:xx=>3000}}]}]}, &@value_doubler)
      )
      assert_equal(
        [22, 44, {:d=>[2, 4, 6, {:zz=>[2000, 4000, {:yy=>{:xx=>6000}}]}], :b=>44, :c=>{:x=>200, :y=>400}, :a=>22}],
        ModalSupport.recursive_map([11,22,{:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3,{:zz=>[1000,2000,{:yy=>{:xx=>3000}}]}]}], &@value_doubler)
      )
    end
    
    should "transform containers" do
      assert_same_elements(
        [[:a, 11], [:b, 22], [:d, [1, 2, 3]]],
        ModalSupport.recursive_map(:a=>11, :b=>22, :d=>[1,2,3], &@hash_to_array)        
      )
      assert_equal(
        {:a=>11, :b=>22, :d=>[1,2,3].inspect},
        ModalSupport.recursive_map(:a=>11, :b=>22, :d=>[1,2,3], &@array_to_string)        
      )
      assert_same_elements(
        [[:a, 11], [:b, 22], [:c, {:x=>100,:y=>200}.to_a], [:d, [1, 2, 3]]],
        ModalSupport.recursive_map(:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3], &@hash_to_array)
      )
      assert_equal(
        {:a=>11, :b=>22, :c=>{:x=>100, :y=>200}, :d=>[1,2,3].inspect},
        ModalSupport.recursive_map(:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3], &@array_to_string)
      )
      ruby_19 do
        # we only test this in Ruby 1.9 because prior versions don't keep Hash ordering
        assert_equal(
          "[111, 222, {:a=>11, :b=>22, :c=>{:x=>100, :y=>200}, :d=>\"[1, 2, 3]\"}]",
          ModalSupport.recursive_map([111,222,{:a=>11, :b=>22, :c=>{:x=>100,:y=>200}, :d=>[1,2,3]}], &@array_to_string)
        )        
      end
    end
    
    should "recursively process elements transformed to a container" do
      assert_equal(
        [222, 444],
        ModalSupport.recursive_map("[111, 222]", &@string_to_cont_and_double)
      )
      assert_equal(
        [222, 444, [2, 4, 6]],
        ModalSupport.recursive_map("[111, 222, [1, 2, 3]]", &@string_to_cont_and_double)
      )
    end

  end

end

