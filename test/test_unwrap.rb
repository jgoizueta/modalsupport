require 'helper'

class TestUnwrap < Test::Unit::TestCase

  should "unwrap brackets" do
    assert_equal "1234", "[1234]".unwrap("[]")
    assert_equal "[1234]", "[[1234]]".unwrap("[]")
    assert_equal "1234", "{1234}".unwrap("{}")
    assert_equal "{1234}", "{{1234}}".unwrap("{}")
    assert_equal "1234", "(1234)".unwrap("()")
    assert_equal "(1234)", "((1234))".unwrap("()")
  end
  
  should "unwrap quotes" do
    assert_equal "1234", '"1234"'.unwrap('""')
    assert_equal "1234", '"1234"'.unwrap('"')
    assert_equal "1234", "'1234'".unwrap("''")
    assert_equal "1234", "'1234'".unwrap("'")
    assert_equal '"1234"', '""1234""'.unwrap('""')
    assert_equal '"1234"', '""1234""'.unwrap('"')
    assert_equal "'1234'", "''1234''".unwrap("''")
    assert_equal "'1234'", "''1234''".unwrap("'")
  end

  should "unwrap and remove external whitespace" do
    assert_equal "1234", " [1234]".unwrap("[]")
    assert_equal "1234", " [1234]   ".unwrap("[]")
    assert_equal "[1234]", "  [[1234]] ".unwrap("[]")
  end
  
  should "preserve internal whitespace" do
    assert_equal "12  34", "[12  34]".unwrap("[]")
    assert_equal "12  3\n4", "[12  3\n4]".unwrap("[]")
    assert_equal "  12  3\n4", "[  12  3\n4]".unwrap("[]")
    assert_equal "  12  3\n4 ", "[  12  3\n4 ]".unwrap("[]")
    assert_equal "  12  3\n4 ", " [  12  3\n4 ] ".unwrap("[]")
    assert_equal "  12  3\n4 ", " [  12  3\n4 ]  ".unwrap("[]")
  end

  should "preserve non-wrapped strings" do
    assert_equal "1234", "1234".unwrap("[]")
    assert_equal "1234", "1234".unwrap('""')
    assert_equal "1234", "1234".unwrap('"')
    assert_equal "  1234  ", "  1234  ".unwrap("[]")
    assert_equal "  1234  ", "  1234  ".unwrap('""')
    assert_equal "  1234  ", "  1234  ".unwrap('"')
  end


end