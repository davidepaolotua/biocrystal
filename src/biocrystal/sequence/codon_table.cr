module Bio
  module Sequence
    struct CodonTable
      @content : Hash(String, String) = {} of String => String
      @name : String

      def initialize(@name, @content)
      end

      def [](triplet) : String | Nil
        @content[triplet]?
      end
    end

    CODON_TABLE_1 = CodonTable.new("Standard (Eukaryote)", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_2 = CodonTable.new("Vertebrate Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "M", "aca" => "T", "aaa" => "K", "aga" => "*",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "*",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_3 = CodonTable.new("Yeast Mitochondorial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "T", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "T", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "T", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "T", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "M", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_4 = CodonTable.new("Mold, Protozoan, Coelenterate Mitochondrial and Mycoplasma/Spiroplasma", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    } # codon table 5
    )

    CODON_TABLE_5 = CodonTable.new("Invertebrate Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "M", "aca" => "T", "aaa" => "K", "aga" => "S",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "S",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_6 = CodonTable.new("Ciliate Macronuclear and Dasycladacean", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "Q", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "Q", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_9 = CodonTable.new("Echinoderm Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "N", "aga" => "S",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "S",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_10 = CodonTable.new("Euplotid Nuclear", {

      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "C",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_11 = CodonTable.new("Bacteria", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_12 = CodonTable.new("Alternative Yeast Nuclear", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "S", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    })

    CODON_TABLE_13 = CodonTable.new("Ascidian Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "M", "aca" => "T", "aaa" => "K", "aga" => "G",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "G",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_14 = CodonTable.new("Flatworm Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "Y", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "N", "aga" => "S",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "S",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    })

    CODON_TABLE_15 = CodonTable.new("Blepharisma Macronuclear", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "Q", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_16 = CodonTable.new("Chlorophycean Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "L", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_21 = CodonTable.new("Trematode Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "S", "taa" => "*", "tga" => "W",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "M", "aca" => "T", "aaa" => "N", "aga" => "S",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "S",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_22 = CodonTable.new("Scenedesmus obliquus mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "L", "tca" => "*", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "L", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )

    CODON_TABLE_23 = CodonTable.new("Thraustochytrium Mitochondrial", {
      "ttt" => "F", "tct" => "S", "tat" => "Y", "tgt" => "C",
      "ttc" => "F", "tcc" => "S", "tac" => "Y", "tgc" => "C",
      "tta" => "*", "tca" => "S", "taa" => "*", "tga" => "*",
      "ttg" => "L", "tcg" => "S", "tag" => "*", "tgg" => "W",

      "ctt" => "L", "cct" => "P", "cat" => "H", "cgt" => "R",
      "ctc" => "L", "ccc" => "P", "cac" => "H", "cgc" => "R",
      "cta" => "L", "cca" => "P", "caa" => "Q", "cga" => "R",
      "ctg" => "L", "ccg" => "P", "cag" => "Q", "cgg" => "R",

      "att" => "I", "act" => "T", "aat" => "N", "agt" => "S",
      "atc" => "I", "acc" => "T", "aac" => "N", "agc" => "S",
      "ata" => "I", "aca" => "T", "aaa" => "K", "aga" => "R",
      "atg" => "M", "acg" => "T", "aag" => "K", "agg" => "R",

      "gtt" => "V", "gct" => "A", "gat" => "D", "ggt" => "G",
      "gtc" => "V", "gcc" => "A", "gac" => "D", "ggc" => "G",
      "gta" => "V", "gca" => "A", "gaa" => "E", "gga" => "G",
      "gtg" => "V", "gcg" => "A", "gag" => "E", "ggg" => "G",
    }
    )
  end
end
