# Define your methods here. 
require "byebug"

def first_letter_vowel_count(sent)
    vowels = "aeiou"
    words = sent.split
    count = 0
    words.each {|word| count += 1 if vowels.include?(word[0].downcase)}
    count
end

def count_true(arr, prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele)}
    count
end

def procformation(arr, prc_1, prc_2, prc_3)
    new_arr = []
    arr.each do |ele|
        if prc_1.call(ele)
            new_arr << prc_2.call(ele)
        else
            new_arr << prc_3.call(ele)
        end
    end
    new_arr
end

def array_of_array_sum(arr)
    new_arr = arr.flatten
    new_arr.inject {|acc, num| acc + num}
end

def selective_reverse(sent)
    words = sent.split
    new_sent = []
    vowels = "aeiou"
    words.each do |word|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
            new_sent << word
        else
            new_sent << word.reverse
        end
    end
    new_sent.join(" ")
end

def hash_missing_keys(hash, *args)
    arr = []
    if args.length == 0
        return arr
    end
    args.each do |arg|
        if !hash.keys.include?(arg)
            arr << arg
        end
    end
    arr
end