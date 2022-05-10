require "byebug"


def range(start_num, end_num)
    return [] if end_num <= start_num
    [start_num] + range(start_num + 1, end_num)
end

# p range(1, 5)

def exp_1(base, n)
    return 1 if n == 0
    base * exp_1(base, n - 1)
end

# p exp_1(3, 4)
# p exp_1(4, 4)
# p exp_1(5, 4)

def exp_2(base, n)
    return 1 if n == 0
    return base if n == 1
    if n.even?
        return exp_2(base, n/2)** 2
    else
        return base * (exp_2(base, (n - 1) /2) ** 2)
    end
end
# p exp_2(3, 4)
# p exp_2(4, 4)
# p exp_2(5, 4)

array_1 = [1, 2, [3, 4, [5, 6]]]
array_2 = [1, [2], [3, [4]]]

def deep_dupe(arr)
    new_arr = []
    arr.each do |ele|
        if ele.is_a?(Array)
            new_arr << deep_dupe(ele)
        else
            new_arr << ele
        end
    end
    new_arr
end

# p deep_dupe(array_1)
# p deep_dupe(array_2)

def fibonnaci_iter(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    fib_arr = [0, 1]
    while fib_arr.length != n
        fib_arr << fib_arr[-1] + fib_arr[-2]
    end
    fib_arr
end

# p fibonnaci_iter(1)
# p fibonnaci_iter(2)
# p fibonnaci_iter(5)
# p fibonnaci_iter(7)


def fibonnaci_recurse(n)
    return [0] if n == 1 
    return [0, 1] if n == 2
    prev = fibonnaci_recurse(n - 1) 
    prev << prev[-1] + prev[-2]
end

# p fibonnaci_recurse(1)
# p fibonnaci_recurse(2)
# p fibonnaci_recurse(5)
# p fibonnaci_recurse(7)

def bsearch(arr, target)
    mid = arr.length / 2
    return mid if arr[mid] == target
    return nil if arr.length == 1 && arr[0] != target

    if arr[mid] < target
        sub_result = bsearch(arr[mid + 1..-1], target)
        if sub_result
            return bsearch(arr[mid + 1..-1], target) + mid + 1
        else
            return sub_result
        end
    end
    if arr[mid] > target
        return bsearch(arr[0...mid], target)
    end
end



# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
    return [arr[0]] if arr.length == 1
    mid = arr.length / 2
    first_half = merge_sort(arr[0...mid]) 
    second_half = merge_sort(arr[mid..-1])
    merge_helper(first_half, second_half)
end


def merge_helper(arr_1, arr_2)
    new_arr = []
    while arr_1.length > 0 && arr_2.length > 0
        if arr_1[0] < arr_2[0]
            new_arr << arr_1[0]
            arr_1.delete_at(0)
        else
            new_arr << arr_2[0]
            arr_2.delete_at(0)
        end
        new_arr += arr_2 if arr_1.length == 0
        new_arr += arr_1 if arr_2.length == 0
    end
    new_arr

end

# p merge_helper([1, 2, 8, 10], [3, 5, 9])

# p merge_sort([93, 74, 2, 68, 540, 3, 1, 69, 82])

def subsets(arr)
    return [[]] if arr.length == 0
    return [[], [arr[0]]] if arr.length == 1
    prev_subs = subsets(arr[0...-1]) 
    last_ele = arr[-1]
    
    new_num_sub = []
    prev_subs.each do |sub|
        sub_copy = sub
        new_num_sub << (sub_copy << last_ele)
    end
    subsets(arr[0...-1]) << new_num_sub
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr)
    return [arr] if arr.length == 1
    perm_bag = []
    prev_perms = permutations(arr[0...-1])
    
    # prev_perms.each do |prev| 
    j = 0
    while j < prev_perms.length
        temp_arr = []
        prev = prev_perms[j]
        i = 0
        while i < arr.length
            temp = prev.insert(i, arr[-1])
            temp_arr << temp
            i += 1
        end
        j += 1
        perm_bag << temp_arr 
    end
    perm_bag
end

puts "------------------------------"
p [1].permutation.to_a
puts "------------------------------"
p [1, 2].permutation.to_a
puts "------------------------------"
p [1, 2, 3].permutation.to_a
puts "-----------------------------------------------------------"

p permutations([1, 2, 3])