
def average(num_1, num_2)
    (num_1 + num_2.to_f)/2
end

def average_array(arr)
    total = arr.inject {|acc, ele| acc + ele }
    total.to_f / arr.length
end

def repeat(str, repeats)
    str * repeats
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split
    alternating_words = []
    i = 0
    while i < words.length
        if i == 0 || i.even?
            alternating_words << words[i].upcase
        else
            alternating_words << words[i].downcase
       end
    i += 1
    end
    alternating_words.join(" ")
end