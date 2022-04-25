require "byebug"

def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject {|doggo| doggo["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count do |sub_arr| 
        sub_arr.inject {|acc, num| acc + num} >=1
    end
end

def aba_translate(word)
    new_word = ""
    vowels = "aeoiu"
    word.each_char do |char|
        if vowels.include?(char)
            new_word << char + "b" + char
        else
            new_word << char
        end
    end
    new_word
end

def aba_array(arr)
    arr.map {|word| aba_translate(word)}
end
