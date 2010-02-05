require 'helper'

class TestUnindent < Test::Unit::TestCase
  
  def setup
    @unindented_text = "First line\nSecond line\n  Third line\nFourth line"
    @indented_text  = "    First line\n    Second line\n      Third line\n    Fourth line"
  end
  
  should "remove indentation from indented text" do
    assert_equal @unindented_text, @indented_text.unindent
  end
  
  should "preserve unindented text" do
    assert_equal @unindented_text, @unindented_text.unindent
  end
  
  should "not remove indentation if first line is not indented" do
    txt = %{First line
      Second line
        Third line
      Fourh line}
    assert_equal txt, txt.unindent  
  end
  
  should "remove empty lines at the beginning and end" do
    assert_equal @unindented_text, %{
      First line
      Second line
        Third line
      Fourth line
    }.unindent
  end
  
  should "replace indentation by a given number of spaces" do
    assert_equal @indented_text, %{
      First line
      Second line
        Third line
      Fourth line
    }.unindent(4)
  end
  
  should "replace indentation by a string" do
    assert_equal @indented_text, %{
      First line
      Second line
        Third line
      Fourth line
    }.unindent("    ")
  end
end