require 'helper'

class TestProduct < Test::Unit::TestCase

  context "Enumerable objects" do

    result = [[1, 1], [1, 2], [1, 3],
              [2, 1], [2, 2], [2, 3],
              [3, 1], [3, 2], [3, 3],
              [4, 1], [4, 2], [4, 3],
              [5, 1], [5, 2], [5, 3]]

    should "have cartesian product iterator" do
      p = []
      (1..5).each_product_pair(1..3) do |pair|
        p << pair
      end
      assert_equal result, p

      p = []
      (1..5).to_a.each_product_pair((1..3).to_a) do |pair|
        p << pair
      end
      assert_equal result, p

      p = []
      (1..5).each_product_pair(1..3) do |x,y|
        p << [x,y]
      end
      assert_equal result, p

    end

    should "have exernal cartesian product iterator" do
      it = (1..5).each_product_pair(1..3)
      p = []
      it.each do |pair|
        p << pair
      end
      assert_equal result, p

      it = (1..5).to_a.each_product_pair((1..3).to_a)
      p = []
      it.each do |pair|
        p << pair
      end
      assert_equal result, p
      
      assert_equal result, (1..5).each_product_pair(1..3).to_a
      assert_equal result, (1..5).to_a.each_product_pair(1..3).to_a
      assert_equal result, (1..5).each_product_pair((1..3).to_a).to_a
      assert_equal result, (1..5).to_a.each_product_pair((1..3).to_a).to_a

    end

  end

end