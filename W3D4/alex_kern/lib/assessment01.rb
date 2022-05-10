require "byebug"
class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    if accumulator
      self.each do |ele|
        accumulator = prc.call(accumulator, ele)
      end
    else
      accumulator = self[0]
      self[1..-1].each do |ele|
        accumulator = prc.call(accumulator, ele)
      end
    end
    accumulator
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2 
  (2...num).each do |factor|
    return false if num % factor == 0
  end
  true
end

def primes(num)
  prime_bag = [] 
  i = 2
  while prime_bag.length < num
    prime_bag << i if is_prime?(i) 
    i += 1
  end
  prime_bag
end


# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  prev = factorials_rec(num - 1)
  prev << (num - 1) * prev[-1]
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new {|h, k| h[k] = []}
    self.each.with_index do |ele, i|
      hash[ele] << i
    end
    hash.select {|k, v| true if v.length >= 2}
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    substrings = []
    self.each_char.with_index do |c1, i|
      self.each_char.with_index do |c2, j|
        ele = self[i..j]
        substrings << ele if i < j && ele.length > 1 && ele == ele.reverse
      end
    end
    substrings
  end
end



class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    prc||= Proc.new {|a, b| a <=> b}
    return self if self.length <=1 
    midpoint = self.length / 2
    left = self[0...midpoint].merge_sort(&prc)
    right = self[midpoint..-1].merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    # debugger
    until left.empty? || right.empty?
      if prc.call(left[0], right[0]) == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right
  end
end
