class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each do |peg|
      return false if !POSSIBLE_PEGS.include?(peg.upcase)
    end
    true 
  end

  attr_reader :pegs

  def initialize(arr)
    if self.class.valid_pegs?(arr)
      @pegs = arr.map {|peg| peg = peg.upcase}
    else
      raise exception
    end
  end

  def self.random(length)
    code_arr = []
    length.times do 
      code_arr << POSSIBLE_PEGS.keys.sample
      
    end
    code = self.new(code_arr)
  end

  def self.from_string(string)
    code_arr = string.split("")
    code = self.new(code_arr)
  end

  def [] (index)
    @pegs[index]
  end  
    
  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    i = 0
    while i < guess.length
      if guess[i] == @pegs[i]
        count += 1
      end
      i += 1
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    i = 0
    non_exacts = []
    code_misses = []
    while i < guess.length
      if guess[i] != @pegs[i]
        non_exacts << guess[i]
        code_misses << @pegs[i]
      end
      i += 1
    end
    
    non_exacts.each do |guess|
      if code_misses.include?(guess) 
        count += 1
      end

    end
    count
  end
  
end


