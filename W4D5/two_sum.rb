require "byebug"


# O(n^2)
def bad_two_sum(array, target)
    array.each_with_index do |ele_1, idx_1|
        array.each_with_index do |ele_2, idx_2|
            return true if idx_1 < idx_2 && ele_1 + ele_2 == target
        end
    end
    false
end

# O(n^2)
def okay_two_sum?(array, target)
    arr = array.sort
    arr.each.with_index do |num, i|
        # debugger
        num2 = target - num
        find = arr.bsearch {|t| t == num2}
        return true if find != nil && find + num == target && arr.index(find) != i
    end
    false
end

# O(n)
def two_sum?(array, target)
    hash = {}
    array.each do |el|
        temp = target - el
        return true if hash[temp] == true
        hash[el] = true
    end
    false 
end