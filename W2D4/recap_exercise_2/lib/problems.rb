require "byebug"

# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    l = num_1 <=> num_2 
    if l == 0
        return num_1
    elsif l == -1
        larger = num_2
    else
        larger = num_1
    end
    max = num_1 * num_2
    (larger..max).each do |i|
        if i % num_1 == 0 && i % num_2 == 0
            return i
        end
    end
    nil
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    i = 0
    while i < str.length - 2
        bigram = [str[i], str[i + 1]].join("")
        hash[bigram] += 1
        i += 1
    end
    freq_bigram = nil
    most_freq = 0
    hash.each do |k, v|
        if v > most_freq
            freq_bigram = k 
            most_freq = v
        end
    end
    freq_bigram
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k    
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        pairs = 0
        self.each.with_index do |ele_1, i_1|
            self.each.with_index do |ele_2, i_2|
                if i_2 > i_1 && ele_1 + ele_2 == num
                    pairs += 1
                end
            end
        end
        pairs 
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|e1, e2| e1 <=> e2}
        sorted = false
        while sorted == false
            sorted = true
            i = 0
            while i < self.length - 1
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                sorted = false
                end
                i += 1
            end
        end
        self
    end
end
