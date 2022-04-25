# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"


def largest_prime_factor(num)
    largest = 0
    (2..num).each do |factor|
        if num % factor == 0 && isprime?(factor)
            largest = factor
        end
    end
    largest
end

def isprime?(num)
    if num < 2
        return false
    end
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end

def unique_chars?(str)
    hash = Hash.new(0)
    str.each_char do |char| 
        if hash.include?(char)
            return false
        else
            hash[char] = 1
        end
    end
    true
end

def dupe_indices(arr)
    hash = Hash.new([])
    arr.each.with_index do |ele, i|
        hash[ele] += [i]
    end
    repeat_hash = Hash.new([])
    hash.each do |k, v|
        if v.length > 1
            repeat_hash[k] = v
        end
    end
    repeat_hash
end

def ana_array(arr_1, arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    arr_1.each {|ele| hash_1[ele] += 1}
    arr_2.each {|ele| hash_2[ele] += 1}
    hash_1 == hash_2
end
