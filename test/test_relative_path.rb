require 'helper'

class TestRelativePaths < Test::Unit::TestCase
  
  context "File.relative_path" do

    should "handle relative paths" do
      assert_equal 'aaa/bbb/ccc/ddd.eee', File.relative_path('aaa/bbb/ccc/ddd.eee')
      assert_equal 'ccc/ddd.eee', File.relative_path('aaa/bbb/ccc/ddd.eee', 'aaa/bbb')
      assert_equal 'aaa/bbb/ccc/ddd.eee', File.relative_path('aaa/bbb/ccc/ddd.eee','/aaa/bbb')
      assert_equal 'aaa/bbb/ccc/ddd.eee', File.relative_path('aaa/bbb/ccc/ddd.eee','xxx/yyy')
      assert_equal 'aaa/bbb/ccc/ddd.eee', File.relative_path('aaa/bbb/ccc/ddd.eee','/xxx/yyy')
    end
  
    should "handle absolute root paths" do
      assert_equal '/aaa/bbb/ccc/ddd.eee', File.relative_path('/aaa/bbb/ccc/ddd.eee')
      assert_equal 'ccc/ddd.eee', File.relative_path('/aaa/bbb/ccc/ddd.eee', '/aaa/bbb')
      assert_equal '/aaa/bbb/ccc/ddd.eee', File.relative_path('/aaa/bbb/ccc/ddd.eee','aaa/bbb')
      assert_equal '/aaa/bbb/ccc/ddd.eee', File.relative_path('/aaa/bbb/ccc/ddd.eee','xxx/yyy')
      assert_equal '/aaa/bbb/ccc/ddd.eee', File.relative_path('/aaa/bbb/ccc/ddd.eee','/xxx/yyy')
    end

    should "handle absolute home paths" do
      assert_equal '~/aaa/bbb/ccc/ddd.eee', File.relative_path('~/aaa/bbb/ccc/ddd.eee')
      assert_equal 'ccc/ddd.eee', File.relative_path('~/aaa/bbb/ccc/ddd.eee', '~/aaa/bbb')
      assert_equal '~/aaa/bbb/ccc/ddd.eee', File.relative_path('~/aaa/bbb/ccc/ddd.eee','aaa/bbb')
      assert_equal '~/aaa/bbb/ccc/ddd.eee', File.relative_path('~/aaa/bbb/ccc/ddd.eee','/aaa/bbb')
      assert_equal '~/aaa/bbb/ccc/ddd.eee', File.relative_path('~/aaa/bbb/ccc/ddd.eee','xxx/yyy')
      assert_equal '~/aaa/bbb/ccc/ddd.eee', File.relative_path('~/aaa/bbb/ccc/ddd.eee','/xxx/yyy')
    end
  
    should "absolute paths with Windows units" do
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee')
      assert_equal 'ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee', 'C:/aaa/bbb')
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee','aaa/bbb')
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee','/aaa/bbb')
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee','D:/aaa/bbb')
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee','xxx/yyy')
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee','/xxx/yyy')
      assert_equal 'C:/aaa/bbb/ccc/ddd.eee', File.relative_path('C:/aaa/bbb/ccc/ddd.eee','C:/xxx/yyy')
    end
  
    if File::ALT_SEPARATOR == "\\"
    should "handle absolute paths with Windows units and Windows separators" do
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee')
      assert_equal 'ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee', 'C:\\aaa\\bbb')
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee','aaa\\bbb')
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee','\\aaa\\bbb')
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee','D:\\aaa\\bbb')
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee','xxx\\yyy')
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee','\\xxx\\yyy')
      assert_equal 'C:\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('C:\\aaa\\bbb\\ccc\\ddd.eee','C:\\xxx\\yyy')
    end
    end
  
    should "handle absolute UNC paths" do
      assert_equal '//aaa/bbb/ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee')
      assert_equal 'ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee', '//aaa/bbb')
      assert_equal '//aaa/bbb/ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee','aaa/bbb')
      unless ruby_engine_is?(:rbx)
        assert_equal '//aaa/bbb/ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee','/aaa/bbb')
      end
      assert_equal '//aaa/bbb/ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee','xxx/yyy')
      assert_equal '//aaa/bbb/ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee','/xxx/yyy')
      assert_equal '//aaa/bbb/ccc/ddd.eee', File.relative_path('//aaa/bbb/ccc/ddd.eee','//xxx/yyy')
    end
  
    if File::ALT_SEPARATOR == "\\"
      # This test fails on non-windows platforms because File.expand_path("\\\\...","base") == "base/\\\\..."
      should "handle absolute UNC paths with Windows separators" do
        assert_equal '\\\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee')
        assert_equal 'ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee', '\\\\aaa\\bbb')
        assert_equal '\\\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee','aaa\\bbb')
        assert_equal '\\\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee','\\aaa\\bbb')
        assert_equal '\\\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee','xxx\\yyy')
        assert_equal '\\\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee','\\xxx\\yyy')
        assert_equal '\\\\aaa\\bbb\\ccc\\ddd.eee', File.relative_path('\\\\aaa\\bbb\\ccc\\ddd.eee','\\\\xxx\\yyy')
      end
    end
  
  end
  
end