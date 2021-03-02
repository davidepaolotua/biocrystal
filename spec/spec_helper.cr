require "spec"
require "../src/biocrystal"

Spec.override_default_formatter(Spec::VerboseFormatter.new)

def with_nucleic_sequence(sequence : String = "atgcatgcatgcatgcaaaa")
  nucleic_sequence = Bio::Sequence::NucleicAcid.new(sequence)
  yield nucleic_sequence
end

def with_aminoacid
  amino_acid = Bio::Sequence::AminoAcid.new("RRLEHTFVFLRNFSLMLLRY")
  yield amino_acid
end
