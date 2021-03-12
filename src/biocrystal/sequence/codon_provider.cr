require "./codon_table"

module Bio
  module Sequence
    module CodonProvider
      extend self
      @@codon_tables : Hash(Int32, CodonTable) = {} of Int32 => CodonTable
      @@default_codon_table : Int32 = 1

      def default_codon_table : Int32
        @@default_codon_table
      end

      def default_codon_table=(key : Int32) : Void
        @@default_codon_table = key
      end

      def [](triplet : String) : String | Nil
        self.[](@@default_codon_table, triplet)
      end

      def [](codon_table, triplet) : String | Nil
        @@codon_tables[codon_table][triplet]
      end

      def register(index : Int32, codon_table : CodonTable) : Void
        raise IndexError.new("Codon table #{index} is already defined") if @@codon_tables[index]?
        @@codon_tables[index] = codon_table
      end
    end

    Bio::Sequence::CodonProvider.register(1, CODON_TABLE_1)
    Bio::Sequence::CodonProvider.register(2, CODON_TABLE_2)
    Bio::Sequence::CodonProvider.register(3, CODON_TABLE_3)
    Bio::Sequence::CodonProvider.register(4, CODON_TABLE_4)
    Bio::Sequence::CodonProvider.register(5, CODON_TABLE_5)
    Bio::Sequence::CodonProvider.register(6, CODON_TABLE_6)
    Bio::Sequence::CodonProvider.register(9, CODON_TABLE_9)
    Bio::Sequence::CodonProvider.register(10, CODON_TABLE_10)
    Bio::Sequence::CodonProvider.register(11, CODON_TABLE_11)
    Bio::Sequence::CodonProvider.register(12, CODON_TABLE_12)
    Bio::Sequence::CodonProvider.register(13, CODON_TABLE_13)
    Bio::Sequence::CodonProvider.register(14, CODON_TABLE_14)
    Bio::Sequence::CodonProvider.register(15, CODON_TABLE_15)
    Bio::Sequence::CodonProvider.register(16, CODON_TABLE_16)
    Bio::Sequence::CodonProvider.register(21, CODON_TABLE_21)
    Bio::Sequence::CodonProvider.register(22, CODON_TABLE_22)
    Bio::Sequence::CodonProvider.register(23, CODON_TABLE_23)
  end
end
