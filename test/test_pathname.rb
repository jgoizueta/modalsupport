require 'helper'

class TestPatname < Test::Unit::TestCase

  context "Pathname#sub_ext should be available" do

    should "substitute filename extensions" do
      assert_equal "/dsfsdfs/aaa.bbb/ccc.doc", Pathname('/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('.doc').to_s
      assert_equal "/dsfsdfs/aaa.bbb/cccdoc", Pathname('/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('doc').to_s
      assert_equal "/dsfsdfs/aaa.bbb/zzz.ccc.doc", Pathname('/dsfsdfs/aaa.bbb/zzz.ccc.txt').sub_ext('.doc').to_s
      assert_equal "zzz.ccc.doc", Pathname('zzz.ccc.txt').sub_ext('.doc').to_s
      assert_equal "zzzccc.doc", Pathname('zzzccc.txt').sub_ext('.doc').to_s
      assert_equal "/dsfsdfs/aaa.bbb/ccc.doc", Pathname('/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('.doc').to_s
      assert_equal "C:/dsfsdfs/aaa.bbb/ccc.doc", Pathname('C:/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('.doc').to_s
    end

    should "append filename extensions" do
      assert_equal "/dsfsdfs/aaa.bbb/ccc.doc", Pathname('/dsfsdfs/aaa.bbb/ccc').sub_ext('.doc').to_s
      assert_equal "/dsfsdfs/aaa.bbb/cccdoc", Pathname('/dsfsdfs/aaa.bbb/ccc').sub_ext('doc').to_s
      assert_equal "zzzccc.doc", Pathname('zzzccc').sub_ext('.doc').to_s
      assert_equal "/dsfsdfs/aaa.bbb/ccc.doc", Pathname('/dsfsdfs/aaa.bbb/ccc').sub_ext('.doc').to_s
      assert_equal "C:/dsfsdfs/aaa.bbb/ccc.doc", Pathname('C:/dsfsdfs/aaa.bbb/ccc').sub_ext('.doc').to_s

      assert_equal "/dsfsdfs/aaa.bbb/ccc..doc", Pathname('/dsfsdfs/aaa.bbb/ccc.').sub_ext('.doc').to_s

      assert_equal "/dsfsdfs/aaa/.doc", Pathname('/dsfsdfs/aaa/').sub_ext('.doc').to_s
      assert_equal ".doc", Pathname('').sub_ext('.doc').to_s

      # To be strict with Pathname we could require:
      # assert_equal "/dsfsdfs/aaa.doc", Pathname('/dsfsdfs/aaa.bbb/').sub_ext('.doc').to_s
      # But we won't; (current implementation returns '/dsfsdfs/aaa.bbb/.doc'

    end

    should "remove filename extensions" do
      assert_equal "/dsfsdfs/aaa.bbb/ccc", Pathname('/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('').to_s
      assert_equal "/dsfsdfs/aaa.bbb/zzz.ccc", Pathname('/dsfsdfs/aaa.bbb/zzz.ccc.txt').sub_ext('').to_s
      assert_equal "/dsfsdfs/aaa.bbb/ccc.", Pathname('/dsfsdfs/aaa.bbb/ccc.').sub_ext('').to_s
      assert_equal "zzz.ccc", Pathname('zzz.ccc.txt').sub_ext('').to_s
      assert_equal "zzzccc", Pathname('zzzccc.txt').sub_ext('').to_s
      assert_equal "/dsfsdfs/aaa.bbb/ccc", Pathname('/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('').to_s
      assert_equal "C:/dsfsdfs/aaa.bbb/ccc", Pathname('C:/dsfsdfs/aaa.bbb/ccc.txt').sub_ext('').to_s
    end

  end

end