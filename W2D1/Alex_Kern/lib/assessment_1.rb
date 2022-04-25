# Define your methods here.

def string_map!(str, &prc)
    str.each_char do |char|
        str[str.index(char)] = prc.call(char)
    end
    str
end

def three?(arr, &prc)
    count = 0
    arr.each {|ele| count += 1 if prc.call(ele)}
    if count == 3
        return true
    end
    false
end 
    
def nand_select(arr, prc_1, prc_2)
    arr_new = []
    arr.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele) 

        else
            arr_new << ele
        end
    end
    arr_new
end

def hash_of_array_sum(hash)
    total_sum = 0
    hash.values.each do |arr|
        if arr.length == 0

        else
            total_sum += arr.inject {|acc, ele| acc += ele}
        end
    end
    total_sum
end

def abbreviate(sentence)
    new_sentence = []
    vowels = "aeiouAEIOU"
    sentence.split.each do |word|
        if word.length > 4
            new_word = ""
            word.each_char do |char|
                if !vowels.include?(char)
                    new_word += char
                end
            end
            new_sentence << new_word
        else
            new_sentence << word
        end
    end
    new_sentence.join(" ")
end

def hash_selector(hash, *args)
    if args.length == 0
        return hash
    end
    new_hash = Hash.new
    hash.each do |k, v|
        if args.include?(k)
            new_hash[k] = v
        end
    end
    new_hash
end