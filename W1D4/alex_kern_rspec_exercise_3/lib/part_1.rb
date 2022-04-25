require "byebug"

def is_prime?(num)
    if num <2
        return false
    end
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    true
end


def nth_prime(n)
    prime_box = []
    i = 1
    while prime_box.length != n 
        if is_prime?(i)
            prime_box << i 
        end
        i += 1
    end
    prime_box[-1]
end

def prime_range(min, max)
    prime_box = []
    i = min
    while prime_box.length == 0 || prime_box.length > 0 && i <= max
        if is_prime?(i)
            prime_box << i 
        end
    i += 1
    if i > max
        break
    end
    end
    prime_box
end


