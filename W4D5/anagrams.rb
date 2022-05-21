
# O(n!)
def first_anagram?(string, target)
    str = string.split("")
    array = str.permutation.to_a
    return true if array.include?(target.split(""))
    false
end

# O(n^2)
def second_anagram?(string, target)
    str = string.split("")
    tar = target.split("")
    str.each do |char|
        if tar.index(char) != nil
            tar.delete_at(tar.index(char))
        end
    end
    return true if tar.length == 0
    false
end

# O(n^2)
def third_anagram?(string, target)
    alph = ("a".."z").to_a
    sorted = false
    while !sorted
        sorted = true
        (0...string.length - 1).each do |i|
            if alph.index(string[i]) > alph.index(string[i+1])
                string[i], string[i+1] = string[i+1], string[i]
                sorted = false
            end
        end
    end
    sorted2 = false
    while !sorted2
        sorted2 = true
        (0...target.length - 1).each do |i|
            if alph.index(target[i]) > alph.index(target[i+1])
                target[i], target[i+1] = target[i+1], target[i]
                sorted2 = false
            end
        end 
    end
    string == target
end

# O(n) 
def fourth_anagram?(string, target)
    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    string.each_char do |char|
        hash1[char] += 1
    end

    target.each_char do |char|
        hash1[char] -= 1
    end

    hash1.values.all? {|v| v == 0}
end
