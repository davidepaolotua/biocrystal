require "../spec_helper"

describe "Translation to aminoacid" do
  it "translates correctly without providing the starting frame" do
    with_nucleic_sequence("aaacccgggttttaa") do |na|
      na.to_aminoacid.content.should eq "KPGF*"
    end
  end

  it "translates correctly providing the frame at 1" do
    with_nucleic_sequence("aaacccgggttttaa") do |na|
      na.to_aminoacid(1).content.should eq "KPGF*"
    end
  end
  it "translates correctly providing the frame at 2" do
    with_nucleic_sequence("aaacccgggttttaa") do |na|
      na.to_aminoacid(2).content.should eq "NPGF"
    end
  end
  it "translates correctly providing the frame at 3" do
    with_nucleic_sequence("aaacccgggttttaa") do |na|
      na.to_aminoacid(3).content.should eq "TRVL"
    end
  end

  it "allows to change codon table" do
    old_codon_table = Bio::Sequence::CodonProvider.default_codon_table
    Bio::Sequence::CodonProvider.default_codon_table = 6
    with_nucleic_sequence("aaacccgggttttaa") do |na|
      na.to_aminoacid.content.should eq "KPGFQ"
    end
    Bio::Sequence::CodonProvider.default_codon_table = old_codon_table
  end
end
