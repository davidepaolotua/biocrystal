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

end
