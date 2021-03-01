module Bio
  module Sequence
    class AminoAcid
      @content : String
      getter content

      def initialize(content)
        @content = content.upcase.tr(" \t\n\r", "")
      end

      def molecular_weight
        full_weight = @content.chars.reduce(0.0) do |acc, amino_acid|
          acc += AMINOACID_WEIGHTS[amino_acid]
          acc
        end
        full_weight - WEIGHTS["water"] * (@content.size - 1)
      end

      # TODO: implement
      def to_re
        raise NotImplementedError
      end

      def codes
        @content.chars.map do |x|
          Bio::AminoAcid.codes[x]
        end
      end

      def names
        codes.map do |x|
          Bio::AminoAcid.names[x]
        end
      end
    end
  end
end
