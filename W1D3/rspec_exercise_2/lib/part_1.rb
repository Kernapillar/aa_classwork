require "byebug"

def partition(arr, num)
    new_arr = Array.new(2) {Array.new(0)}
    arr.each do |ele|
        if ele < num
            new_arr[0] << ele
        else
            new_arr[1] << ele
        end
    end
    new_arr
end

def merge(hash_1, hash_2)
    new_hash = {}
    hash_2.each {|k_2, v_2| new_hash[k_2] = v_2}
    hash_1.each do |k_1, v_1|
        if !new_hash.keys.include?(k_1)
            new_hash[k_1] = v_1
        end
    end
    new_hash
end

def censor(sentence, arr)
    curses = Hash.new
    arr.each do |curse| 
        curses[curse] = word_censor(curse)
    end
    sent = sentence.split
    origional = sentence.split
    new_sent = sent.each.with_index do |word, i|
        word = word.downcase
        if curses.include?(word)
            sent[i] = curses[word]
        end
    end
    new_sent.each do |word|
        word.each_char.with_index do |char, i|
            old_letter = origional[new_sent.index(word)][i]
            if old_letter == char.upcase && char != "*"
                word[i] = old_letter
            end
        end
    end
    new_sent.join(" ")
end

def word_censor(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char do |char|
        if vowels.include?(char)
            new_word << "*"
        else
            new_word << char
        end
    end
    new_word
end

def power_of_two?(num)
    (0...num).each do |factor|
        if 2 ** factor == num
            return true
        end
    end
    false
end