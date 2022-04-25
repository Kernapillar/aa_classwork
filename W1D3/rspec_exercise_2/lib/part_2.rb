require "byebug"

def palindrome?(str)
    rev = ""
    str.each_char do |char|
        rev = char + rev
    end
    if str == rev
        return true
    end
    false
end

def substrings(str)
    arr = []
    (0...str.length).each do |p1|
        (p1...str.length).each do |p2|
            arr << str[p1..p2]
        end
    end
    arr
end

def palindrome_substrings(str)
    arr = substrings(str)
    new_arr = []
    arr.each do |ele|
        if palindrome?(ele) && ele.length > 1
            new_arr << ele
        end
    end
    new_arr
end