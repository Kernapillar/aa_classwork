require "byebug"

# Phase 1

def strange_sums(arr)
    counter = 0
    if arr.length < 1
        return 0
    end
    arr.each.with_index do |ele_1, i_1|
        arr.each.with_index do |ele_2, i_2|
            if ele_1 + ele_2 == 0 && i_2 >= i_1
                counter += 1
            end
            
        end
    end
    counter
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0


def pair_product(arr, prod)
    arr.each do |num_1|
        arr.each do |num_2|
            if num_1 != num_2 && num_1 * num_2 == prod
                return true
            end
        end
    end
    false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.include?(char)
            new_str += char * hash[char]
        else
            new_str += char
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'


def perfect_square(num)
    (0..num).each do |factor|
        if factor * factor == num
            return true
        end
    end
    false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false


# Phase 2

def anti_prime?(num)
    num_divisors = divisors(num)
    (1...num).each do |other|
        if divisors(other) > num_divisors
            return false
        end
    end
    true
end

def divisors(num)
    count = 0
    (1...num).each do |factor|
        if num % factor == 0
            count += 1
        end
    end
    count
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


def matrix_addition(matrix_1, matrix_2)
    return_matrix = Array.new(matrix_1.length) {Array.new(2)}
    matrix_1.each.with_index do |sub_arr, i|
        return_matrix[i][0] = sub_arr[0] + matrix_2[i][0]
        return_matrix[i][1] = sub_arr[1] + matrix_2[i][1]
    end
    return_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


def mutual_factors(*nums)
    hash = Hash.new
    nums.each do |num|
        hash[num] = mutual_divisors(num)
    end
    mutuals = []
    i = 0
    hash.values[0].each do |num|
        mutual = true
        hash.values.each do |arr|
            if !arr.include?(num)
                mutual = false
            end
        end
        if mutual
            mutuals << num
        end
    end
    mutuals
end

def mutual_divisors(num)
    divisors = []
    (1..num).each do |factor|
        if num % factor == 0
            divisors << factor
        end
    end
    divisors
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


def tribonacci_number(num)
    trib = [1, 1, 2]
    if num < 3
        return trib[num - 1]
    end
    while trib.length != num
        trib << trib[-1] + trib[-2] + trib[-3]
    end
    trib[-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


# Phase 3

def matrix_addition_reloaded(*matrices)
    len = matrices[0].length
    matrices.each do |matrix|
        if matrix.length != len
            return nil
        end
    end
    matrices.inject {|acc, matrix| matrix_addition(acc, matrix) }
endf
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(arr)
    dimension = arr.length
    # horizontal
    arr.each do |row|
        counter = 0
        row.each do |num|
            
            if num == row[0]
                counter += 1
            end
        end
        if counter == dimension
            return true
        end
    end
    # vertical
    arr[0].each.with_index do |ele, i|
        counter_2 = 0
        arr.each do |row|
            if row[i] == arr[0][i]
                counter_2 += 1
            end
        end
        if counter_2 == dimension
            return true
        end
    end
    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(arr)
    # Top Left
    dimension = arr.length
    if diagonal_check(arr)
        return true
    end
    # Bottom Left 
    arr = arr.reverse
    if diagonal_check(arr)
        return true
    end
    false
end

def diagonal_check(arr)
    dimension = arr.length
    i = 0
    shift = 0
    counter = 0
    starter = arr[0][0]
    while i < dimension
        if arr[i][shift] == starter
            counter += 1
        end
        i += 1
        shift += 1
    end
    if counter == dimension
        return true
    end
    false
end
# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

def pascals_triangle(n)
    pascal = [
        [1], 
        [1, 1], 
        [1, 2, 1]]
    while pascal.length < n
         pascal << new_row_pascal(pascal[-1])
    end
    return pascal
end

def new_row_pascal(arr)
    new_row = [1]
    i = 1
    while new_row.length != arr.length
        new_row << (arr[i] + arr[i-1])
        i += 1
    end
    new_row << 1
    new_row
end
# p new_row_pascal([1, 3, 3, 1])

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

# Phase 4

def mersenne_prime(n)
    m_primes = []
    counter = 0
    while m_primes.length < n
        potential = (2** counter) - 1
        if prime?(potential)
            m_primes << potential
        end
        counter += 1
    end
    m_primes[-1]
end

def prime?(n)
    if n < 2
        return false
    end
    (2...n).each do |factor|
        if n % factor == 0
            return false
        end
    end
    true
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    target = word_encoder(word)

    tri = 1
    while tri < target
        if (tri * (tri + 1) /2) == target
            return true
        end
        tri += 1
    end
    false
end

def word_encoder(word)
    coded = 0
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    word.each_char do |char|
        coded += alphabet.index(char) + 1
    end
    coded
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    i = 0
    done = false
    while done == false && i < arr.length 
        current = arr[i]
        next_num = [(current + 1), (current - 1)]
        if next_num.include?(arr[i+1])
            arr = arr[0...i] + arr[(i +2)..-1]
            i = 0
            done == false
        elsif current == arr[-1]
            done = true
        else 
            i += 1
        end
    end

    arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []


def pretentious_primes(arr, n)
    new_arr = []
    if n >= 0
        steps = n
        arr.each do |ele|
            bag = generate_prime_bag(ele, steps)
            new_arr << bag[-1]
        end
    else
        steps = (n * -1) +1
        arr.each do |ele|
            bag = generate_prime_bag(ele)
            if steps > bag.length 
                new_arr << nil
            else
                new_arr << bag[-steps]
            end
        end
    end
    new_arr
end

def generate_prime_bag(target, steps_above=0)
    prime_bag = [2]
    numbers = 3
    while prime_bag[-1] < target
        if prime?(numbers)
            prime_bag << numbers
        end
        numbers += 1
    end
    current_len = prime_bag.length
    if prime_bag[-1] != target
        while prime_bag.length < current_len + steps_above -1
            if prime?(numbers)
                prime_bag << numbers
            end
            numbers += 1
        end
    else
        while prime_bag.length < current_len + steps_above 
            if prime?(numbers)
                prime_bag << numbers
            end
            numbers += 1
        end
    end
    prime_bag
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
