def hipsterfy(str)
    vowels = "aeiou"
    chars = str.reverse
    i = 0
    new_str_rev = ""
    while i < str.length
        if i == 0 && vowels.include?(chars[i]) 
            new_str_rev << chars[1..-1]
            return new_str_rev.reverse
        elsif i != str.length - 1 && vowels.include?(chars[i]) 
            new_str_rev << chars[0...i] + chars[(i+1)...chars.length]
            return new_str_rev.reverse
        elsif i == str.length - 1 && vowels.include?(chars[i]) 
            new_str_rev << chars[0...(chars.length - 1)]
            return new_str_rev.reverse
        end
        i += 1
    end
    str
end


def vowel_counts(str)
    vowels = "aeiou"
    hash = Hash.new(0)
    str.downcase.each_char do |char|
        if vowels.include?(char)
            hash[char] += 1
        end
    end
    hash
end

def caesar_cipher(str, num)
    letters = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""

    str.each_char do |char|
        if letters.include?(char) 
            new_str << letters[(letters.index(char) + num)% 26]

        else
            new_str << char
        end
    end
    new_str
end