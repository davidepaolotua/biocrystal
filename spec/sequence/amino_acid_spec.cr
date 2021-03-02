require "../spec_helper"

describe "An amino acid sequence" do
  it "removes space characters when instantiating" do
    [" ", "\t", "\n", "\r"].each do |special_char|
      expected_string = "RRLEHTFVFLRNFSLMLLRY"
      str = "RRLEHTFVFL#{special_char}RNFSLMLLRY"
      Bio::Sequence::AminoAcid.new(str).content.should eq expected_string
    end
  end

  it "returns the correct weight" do
    with_aminoacid do |aa|
      aa.molecular_weight.should be_close(2612.105, 0.001)
    end
  end

  it "returns the correct codes" do
    expected_codes = ["Arg", "Arg", "Leu", "Glu", "His", "Thr", "Phe", "Val",
                      "Phe", "Leu", "Arg", "Asn", "Phe", "Ser", "Leu", "Met",
                      "Leu", "Leu", "Arg", "Tyr"]
    with_aminoacid { |aa| aa.codes.should eq(expected_codes) }
  end

  it "returns the correct names" do
    expected_names = ["arginine", "arginine", "leucine", "glutamic acid",
                      "histidine", "threonine", "phenylalanine", "valine",
                      "phenylalanine", "leucine", "arginine", "asparagine",
                      "phenylalanine", "serine", "leucine", "methionine",
                      "leucine", "leucine", "arginine", "tyrosine"]
    with_aminoacid { |aa| aa.names.should eq expected_names }
  end
end
