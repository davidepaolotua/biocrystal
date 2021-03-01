class String
  def tally # : Hash(String, Int64)
    result = Hash(String, Int64).new { |h, k| h[k] = 0 }
    self.each_char.reduce(result) do |mem, val|
      mem[val.to_s] += 1
      mem
    end
    result
  end
end
