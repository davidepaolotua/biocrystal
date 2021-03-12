require "../data/nucleotides"
require "../data/misc"
require "./codon_provider"

module Bio
  module Sequence
    struct NucleicAcid
      @content : String
      @nucleotide_counts : Hash(String, Int64)?
      getter content

      def initialize(content : String)
        @content = content.downcase.tr(" \t\n\r", "")
      end

      def forward_complement
        if rna?
          NucleicAcid.new(content.tr("augcrymkdhvbswn", "uacgyrkmhdbvswn"))
        else
          NucleicAcid.new(content.tr("atgcrymkdhvbswn", "tacgyrkmhdbvswn"))
        end
      end

      def reverse_complement
        if rna?
          NucleicAcid.new(content.reverse.tr("augcrymkdhvbswn", "uacgyrkmhdbvswn"))
        else
          NucleicAcid.new(content.reverse.tr("atgcrymkdhvbswn", "tacgyrkmhdbvswn"))
        end
      end

      def to_aminoacid(start_index : Int64 = 1, unknown : String = "X") : AminoAcid
        raise IndexError.new unless start_index <= 3 && start_index > 0
        triplets = [] of String
        window(3, 3, start_index - 1) do |chunk|
          break if chunk.size < 3
          triplets << (CodonProvider[chunk] || unknown)
        end
        AminoAcid.new(triplets.join(""))
      end

      def codon_usage
        chunks = Hash(String, Int64).new { |h, k| h[k] = 0 }
        window(3, 3) do |chunk|
          break if chunk.size < 3
          chunks[chunk] += 1
        end
        chunks
      end

      def gc_percent
        (gc_content * 100).round(1)
      end

      def gc_content : Float64
        return 0.0 if content.empty?
        1.0*(nucleotide_counts["g"] + nucleotide_counts["c"]) / content.size
      end

      def at_content
        1.0*(nucleotide_counts["a"] + nucleotide_counts["t"] + nucleotide_counts["u"]) / content.size
      end

      def gc_skew
        return 0.0 if content.empty?
        1.0 * (nucleotide_counts["g"] - nucleotide_counts["c"])/(nucleotide_counts["g"] + nucleotide_counts["c"])
      end

      def at_skew
        return 0.0 if content.empty?
        total_t = nucleotide_counts["t"] + nucleotide_counts["u"]
        1.0 * (nucleotide_counts["a"] - total_t)/(nucleotide_counts["a"] + total_t)
      end

      def illegal_bases : Array(String)
        nucleotide_counts.keys.reject { |k| ["a", "t", "g", "c", "u"].includes? k.to_s }.sort!.uniq!.map(&.to_s)
      end

      def weight(phosphate_weight)
        return NUCLEOTIDE_WEIGHT[content[0]] if content.size == 1
        hydrogen = WEIGHTS["hydrogen"]
        water = WEIGHTS["water"]
        total = 0.0
        nucleotide_counts.each do |nucleotide, amount|
          total += (NUCLEOTIDE_WEIGHT[nucleotide] + phosphate_weight - hydrogen * 2) * amount
        end
        total -= water * (content.size - 1)
      end

      def molecular_weight
        raise "Illegal bases detected" unless illegal_bases.empty?
        phosphate_weight = rna? ? WEIGHTS["ribose_phosphate"] : WEIGHTS["deoxyribose_phosphate"]
        weight(phosphate_weight)
      end

      # TODO: implement
      def to_re
        raise NotImplementedError
      end

      def to_dna
        self.class.new(content.tr("u", "t"))
      end

      def to_rna
        self.class.new(content.tr("t", "u"))
      end

      private def rna?
        content.index("u")
      end

      def cut_with_enzyme
      end

      def to_s(io)
        io << @content
      end

      private def window(size : Int64, step : Int64 = 1, starting_point : Int64 = 0, &block)
        number : Int64 = starting_point
        number.step(by: step) do |start_index|
          yield content[start_index, size]
        end
      end

      private def nucleotide_counts
        @nucleotide_counts ||= content.tally
      end
    end
  end
end
