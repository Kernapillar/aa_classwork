require "byebug"

def proper_factors(num)
    arr = []
    (1...num).each do |factor|
        if num % factor == 0
            arr << factor 
        end
    end
    arr
end

def aliquot_sum(num)
    proper_factors(num).inject {|acc, ele| acc + ele}
end

def perfect_number?(num)
    if num == aliquot_sum(num)
        return true
    end
    false
end

def ideal_numbers(n)
    arr = []
    i = 1
    while arr.length != n
        if perfect_number?(i)
            arr << i
        end
        i += 1
    end
    arr
end