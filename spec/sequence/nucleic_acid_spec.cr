# loading helper routine for testing bioruby
# require 'pathname'
# load Pathname.new(File.join(File.dirname(__FILE__), ['..'] * 3,
#                             'bioruby_test_helper.rb')).cleanpath.to_s

require "../spec_helper"

describe "A Nucleic Acid Sequence" do
  it "automatically strips space chars on instantiation" do
    [" ", "\t", "\n", "\r"].each do |special_char|
      expected_string = "atgcatgcatgcatgcaaaa"
      str = "atgcatg#{special_char}catgcatg#{special_char}caaaa"
      Bio::Sequence::NucleicAcid.new(str).content.should eq expected_string
    end
  end

  it "provides the forward complement" do
    with_nucleic_sequence do |na|
      na.forward_complement.content.should eq("tacgtacgtacgtacgtttt")
    end
  end

  it "provides the reverse complement" do
    with_nucleic_sequence do |na|
      reversed_value = "tacgtacgtacgtacgtttt".reverse
      na.reverse_complement.content.should eq(reversed_value)
    end
  end

  it "returns the frequency of codons" do
    with_nucleic_sequence do |na|
      expected_usage = {"cat" => 1, "caa" => 1, "tgc" => 1, "gca" => 1, "atg" => 2}
      na.codon_usage.should eq expected_usage
    end
  end

  it "returns the correct gc percentage" do
    with_nucleic_sequence do |na|
      expected_percentage = 40
      na.gc_percent.should eq expected_percentage
    end
  end

  it "returns the correct gc_content" do
    with_nucleic_sequence do |na|
      na.gc_content.should eq 0.4
    end
  end

  it "returns the correct at_content" do
    with_nucleic_sequence do |na|
      na.at_content.should eq 0.6
    end
  end

  it "returns the correct gc skew" do
    with_nucleic_sequence do |na|
      expected_skew = 0.0
      na.gc_skew.should eq expected_skew
    end
    other_sequence = Bio::Sequence::NucleicAcid.new("gtgcctgcctgcctgccccc")
    other_sequence.gc_skew.should eq -3.0/8
  end

  it "returns the correct at skew" do
    with_nucleic_sequence do |na|
      na.at_skew.should eq 1.0/3
    end
  end

  it "returns the illegal bases in the content" do
    sequence = Bio::Sequence::NucleicAcid.new("gtgWcctgcctycctgccccc")
    sequence.illegal_bases.should eq ["w", "y"]
  end

  it "returns the correct molecular weight" do
    with_nucleic_sequence do |na|
      na.molecular_weight.should be_close(6174.3974, 0.0001)
    end
  end

  it "converts to dna if it is a rna" do
    sequence = Bio::Sequence::NucleicAcid.new("utgcatgcatgcatgcaaaa")
    sequence.to_dna.content.should eq("ttgcatgcatgcatgcaaaa")
  end

  it "converts to rna if it is a dna" do
    with_nucleic_sequence do |na|
      na.to_rna.content.should eq("augcaugcaugcaugcaaaa")
    end
  end
end
#     def test_splicing
#       #     'atgcatgcatgcatgcaaaa'
#       #      12345678901234567890
#       str = 'atgca  catgcatg'.gsub(' ','')
#       assert_equal(str, @obj.splicing("join(1..5,8..15)"))
#     end
#     def test_to_s
#       str = 'atgcatgcatgcatgcaaaa'
#       assert_equal(str, @obj.to_s)
#     end

#     def test_to_re
#       assert_equal(/atgcatgcatgcatgcaaaa/, @obj.to_re)
#       @obj[1,1] = 'n'
#       @obj[2,1] = 'r'
#       @obj[3,1] = 's'
#       @obj[4,1] = 'y'
#       @obj[5,1] = 'w'
#       assert_equal(/a[atgcyrwskmbdhvn][agr][gcs][tcy][atw]gcatgcatgcaaaa/, @obj.to_re)
#     end

#     def test_names
#       ary = ["Adenine", "Thymine", "Guanine"]
#       assert_equal(ary , @obj.splice("1..3").names)
#     end

#   class TestSequenceNACommon < Test::Unit::TestCase

#     def setup
#       @obj  = Bio::Sequence::NA.new('atgcatgcatgcatgcaaaa')
#     end

#     def test_to_s
#       assert_equal('atgcatgcatgcatgcaaaa', @obj.to_s)
#     end

#     def test_to_str
#       assert_equal('atgcatgcatgcatgcaaaa', @obj.to_str)
#     end

#     def test_seq
#       str = "atgcatgcatgcatgcaaaa"
#       assert_equal(str, @obj.seq)
#     end

#     # <<(*arg)
#     def test_push
#       str = "atgcatgcatgcatgcaaaaa"
#       assert_equal(str, @obj << "A")
#     end

#     # concat(*arg)
#     def test_concat
#       str = "atgcatgcatgcatgcaaaaa"
#       assert_equal(str, @obj.concat("A"))
#     end

#     # +(*arg)
#     def test_sum
#       str = "atgcatgcatgcatgcaaaaatgcatgcatgcatgcaaaa"
#       assert_equal(str, @obj + @obj)
#     end

#     # window_search(window_size, step_size = 1)
#     def test_window_search
#       @obj.window_search(4) do |subseq|
#         assert_equal(20, @obj.size)
#       end
#     end

#     #total(hash)
#     def test_total
#       hash = {'a' => 1, 'c' => 2, 'g' => 4, 't' => 3}
#       assert_equal(44.0, @obj.total(hash))
#     end

#     def test_composition
#       composition = {"a"=>8, "c"=>4, "g"=>4, "t"=>4}
#       assert_equal(composition, @obj.composition)
#     end

#     def test_splicing
#       #(position)
#       assert_equal("atgcatgc", @obj.splicing("join(1..4, 13..16)"))
#     end
#   end

#   class TestSequenceNATranslation < Test::Unit::TestCase
#     def setup

#       str = "aaacccgggttttaa"
#       #      K>>P>>G>>F>>*>>
#       #       N>>P>>G>>F>>
#       #        T>>R>>V>>L>>
#       #         P>>G>>F>>*>>
#       #     "tttgggcccaaaatt"
#       #      <<F<<G<<P<<K<<L
#       #        <<G<<P<<N<<*
#       #       <<V<<R<<T<<K
#       @obj = Bio::Sequence::NA.new(str)
#     end

#     def test_translate
#       assert_equal("KPGF*", @obj.translate)
#     end

#     def test_translate_1
#       assert_equal("KPGF*", @obj.translate(1))
#     end

#     def test_translate_2
#       assert_equal("NPGF", @obj.translate(2))
#     end

#     def test_translate_3
#       assert_equal("TRVL", @obj.translate(3))
#     end

#     def test_translate_4
#       assert_equal("LKPGF", @obj.translate(4))
#     end

#     def test_translate_5
#       assert_equal("*NPG", @obj.translate(5))
#     end

#     def test_translate_6
#       assert_equal("KTRV", @obj.translate(6))
#     end

#     def test_translate_7
#       assert_equal("KPGF*", @obj.translate(7))
#       assert_equal(@obj.translate, @obj.translate(7))
#     end

#     def test_translate_n1
#       assert_equal("LKPGF", @obj.translate(-1))
#       assert_equal(@obj.translate(4), @obj.translate(-1))
#     end

#     def test_translate_n2
#       assert_equal("*NPG", @obj.translate(-2))
#       assert_equal(@obj.translate(5), @obj.translate(-2))
#     end

#     def test_translate_n3
#       assert_equal("KTRV", @obj.translate(-3))
#       assert_equal(@obj.translate(6), @obj.translate(-3))
#     end

#     def test_translate_0
#       assert_equal("KPGF*", @obj.translate(0))
#       assert_equal(@obj.translate, @obj.translate(0))
#       assert_equal(@obj.translate(7), @obj.translate(0))
#     end

#     def test_translate_unknown_x
#       @obj[3, 1] = 'N'
#       assert_equal("KXGF*", @obj.translate)
#     end

#     def test_translate_unknown_o
#       @obj[3, 1] = 'N'
#       assert_equal("KOGF*", @obj.translate(1, 1, 'O'))
#     end

#     def test_translate_given_codon_table
#       @obj[0, 1] = 't'
#       @obj[1, 1] = 'g'
#       @obj[2, 1] = 'a'
#       seleno_ct = Bio::CodonTable.copy(1)
#       seleno_ct['tga']  = 'U'
#       assert_equal("UPGF*", @obj.translate(1, seleno_ct))
#     end

#   end

# end
