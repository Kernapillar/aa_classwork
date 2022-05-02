require "byebug"

def no_dupes?(arr)
    new_arr = []
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash.each {|k, v| new_arr << k if v == 1}
    new_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    i = 0
    while i < arr.length - 1
        if arr[i] == arr[i+1]
            return false
        end
        i += 1
    end
    true
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    hash = Hash.new {|h, k| h[k] = []}
    str.each_char.with_index {|char, i| hash[char] << i}
    hash
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    i = 0
    longest = ""
    while i < str.length
        j = i + 1
        contender = str[i]
        while str[i] == str[j]
            contender += str[j]
            j += 1
        end
        longest = contender if contender.length >= longest.length
        i = j
    end
    longest
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    prime_bag = [2]
    p = 3 
    while prime_bag[-1] < num
        prime_bag << p if prime?(p)
        p += 1
    end
    prime_bag.each do |prime1|
        prime_bag.each do |prime2|
            if prime1 * prime2 == num
                return true
            end
        end
    end
    false
end

def prime?(n)
    (2...n).each do |factor|
        return false if n % factor == 0
    end
    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


def vigenere_cipher(message, keys)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
    i = 0
    while i < message.length
        key_index = i % keys.length
        key = keys[key_index]
        shifted = alphabet[(alphabet.index(message[i]) + key) % 26]
        new_str += shifted
        i += 1
    end
    new_str
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = "aeiou"
    holder = nil
    first_vowel = nil
    i = 0
    while i < str.length
        if vowels.include?(str[i]) && holder == nil
            holder = str[i]
            first_vowel = i
        elsif vowels.include?(str[i])
            str[i], holder = holder, str[i]
        end
        i += 1
    end
    str[first_vowel] = holder
    str
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

# Proc Problems

class String

    def select(&prc)
        new_str = ""
        return new_str if prc == nil
        self.each_char {|char| new_str << char if prc.call(char)}
        new_str
    end

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

class String

    def map!(&prc)
        self.each_char.with_index {|char, i| self[i] = prc.call(char, i)}
        self 
    end


end

# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

# Recursion Problems

def multiply(a, b)
    return 0 if b == 0

    if b < 0
        return -(a + multiply(a, -(b + 1)))
    end
    a + (multiply(a, b - 1))

end


# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


def lucas_sequence(num)
    if num == 0
        return []
    elsif num == 1 
        return [2]
    elsif num == 2 
        return [2, 1]
    end
    sequence = lucas_sequence(num - 1)
    next_num = sequence[-1] + sequence[-2]
    sequence << next_num
end


# # Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    (2...num).each do |factor|
        if num % factor == 0
            other = num / factor
            return [prime_factorization(factor), prime_factorization(other)]
        end
    end
    [num]
end


p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]