class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
     hash_num = 0
     self.each_with_index do |el, i|
        if el.is_a?(Integer)
          len = el * 73
          hash_num += (len + 2437 * (i * el))
        else
          len = el.length
          hash_num += (len + 2437 * (i * el.length))
        end
     end
     hash_num
  end
end

class String
  def hash
    hash_num = 0

    vowel = "aeiou"
    con_1 = "bcdfg"
    con_2 = "hjkl"
    con_3 = "mnpqr"
    con_4 = "stvwx"
    con_5 =  "yz"
    self.each_char.with_index do |char,i|
      if vowel.include?(char.downcase)
        hash_num += (char.ord * i + 32)
      elsif con_1.include?(char.downcase)
        hash_num += char.ord * i * 3
      elsif con_2.include?(char.downcase)
        hash_num += char.ord * i + 0
      elsif con_3.include?(char.downcase)
        hash_num += char.ord * i + 38872
      elsif con_4.include?(char.downcase)
        hash_num += char.ord * i * 43
      elsif con_5.include?(char.downcase)
        hash_num += char.ord * i + 32 * 52
      else
        hash_num += (char.ord / i * 23048)
      end
    end
    hash_num
  end
end


class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_num = 0
    self.keys.each do |ele|
      hash_num += ele.hash
    end
    
    self.values.each do |ele|
      hash_num += ele.hash + 1
    end
    hash_num
  end
end
