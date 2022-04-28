# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = ["a", "e", "i", "o", "u"]
    pairs = []
    words.each.with_index do |word_1, i_1|
        words.each.with_index do |word_2, i_2|
            if i_2 >= i_1
                combo_vowels = vowel_extractor(word_1) + vowel_extractor(word_2)
                if vowels.all? {|vowel| combo_vowels.include?(vowel)}
                    pairs << word_1 + " " + word_2
                end
            end
        end
    end
    pairs
end

def vowel_extractor(word)
    vowels = "aeiou"
    contained_vowels = []
    word.each_char do |char|
        if vowels.include?(char)
            contained_vowels << char
        end
    end
    contained_vowels
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |factor|
        return true if num%factor == 0
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    found = []
    bigrams.each { |b| found << b if str.include?(b)}
    found
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = {}
        if prc 
            self.each {|k, v| new_hash[k] = v if prc.call(k, v)} 
        else
            self.each {|k, v| new_hash[k] = v if k == v}
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        sub_str = self.get_sub
        ret_subs = []
        if length
            sub_str.select {|ele| ret_subs << ele if ele.length == length }
        else
            return sub_str
        end
        ret_subs
    end

    def get_sub
        sub_str = []
        i = 0
        while i < self.length
            j = i
            while j != self.length
                sub_str << self[i..j]
                j += 1
            end
            i += 1
        end
        sub_str
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        new_str = ""
        self.each_char do |char|
            shift = (alphabet.index(char) + num) % 26
            new_str += alphabet[shift]
        end
        new_str
    end
end
