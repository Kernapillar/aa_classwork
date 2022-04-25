# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    new_str = ""
    index = 0

    while index < str.length
        current = str[index]
        counter = 0
        while current == str[index]
            counter += 1
            index += 1
        end
        if counter > 1
            new_str << counter.to_s + current
        else
            new_str << current
        end

    end
    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
