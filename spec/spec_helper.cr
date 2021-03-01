require "spec"
require "../src/biocrystal"

def with_nucleic_sequence
  nucleic_sequence = Bio::Sequence::NucleicAcid.new("atgcatgcatgcatgcaaaa")
  yield nucleic_sequence
end
