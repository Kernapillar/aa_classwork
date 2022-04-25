require "byebug"

def my_reject(arr, &prc)
    new_arr = []
    arr.each do |ele|
        if !prc.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def my_one?(arr, &prc)
    counter = 0
    arr.each do |ele|
        if prc.call(ele)
            counter += 1
        end
    end
    if counter != 1
        return false
    end
    true
end

def hash_select(hash, &prc)
    new_hash = Hash.new
    hash.each do |k, v|
        if prc.call(k, v)
            new_hash[k] = v
        end
    end
    new_hash
end

def xor_select(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        if prc_1.call(ele) == true && prc_2.call(ele) == false ||  prc_1.call(ele) == false && prc_2.call(ele) == true
            new_arr << ele    
        end
    end
    new_arr
end

def proc_count(val, arr)
    count = 0
    arr.each do |proc|
        if proc.call(val)
            count += 1
        end
    end
    count
end