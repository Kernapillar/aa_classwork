require "byebug"

def zip(*arrays)
    new_arr = []
    i = 0
    while new_arr.length != arrays[0].length 
        sub_arr = []
        arrays.each do |arr|
            sub_arr << arr[i]
        end
        new_arr << sub_arr
        i += 1
    end
    new_arr
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if prc1.call(ele) && !prc2.call(ele) || !prc1.call(ele) && prc2.call(ele)
    end
    new_arr
end

def zany_zip(*arrs)
    max_len = 0
    arrs.each do |sub|
        if sub.length >= max_len
            max_len = sub.length
        end
    end
    arrs.each do |arr| 
        while arr.length < max_len
            arr << nil
        end
    end
    new_arr = []
    i = 0
    while new_arr.length != arrs[0].length 
        sub_arr = []
        arrs.each do |arr|
            sub_arr << arr[i]
        end
        new_arr << sub_arr
        i += 1
    end
    new_arr
end

def maximum(arr, &prc)
    if arr.length == 0
        return nil
    end
    largest = arr[0]
    arr.each do |ele|
        if prc.call(ele) >= prc.call(largest)
            largest = ele
        end
    end
    largest
end

def my_group_by(arr, &prc)
    hash = Hash.new 
    keys = []
    arr.each do |ele|
        keys << prc.call(ele)
    end
    keys.each do |k|
        values = []
        arr.each do |ele|
            if prc.call(ele) == k
                values << ele
            end
        end
        hash[k] = values
    end
    hash
end

def max_tie_breaker(arr, prc, &blok)
    if arr.length == 0
        return nil
    end
    largest = arr[0]
    arr.each do |ele|
        if blok.call(ele) > blok.call(largest)
            largest = ele
        elsif blok.call(ele) == blok.call(largest)
            if prc.call(ele) > prc.call(largest)
                largest = ele
            end
        end
    end
    largest
end

def silly_syllables(sent)
    v_index = "aeiou"
    words = sent.split
    new_words = []
    words.each do |word|
        v_count = 0
        word.each_char do |char|
            if v_index.include?(char)
                v_count += 1
            end
        end
        if v_count < 2
            new_words << word
        else
            f_l = first_last_vowel(word)
            first = f_l[0]
            last = f_l[-1]
            new_words << word[first..last]
        end
    end
    new_words.join(" ")
end

def first_last_vowel(word)
    vowels = "aeiou"
    v_index = []
    f = false
    l = false
    word.each_char.with_index do |char, i|
        if vowels.include?(char) && f == false
            v_index << i
            f = true
        end
    end
    word.reverse.each_char.with_index do |char, i|
        if vowels.include?(char) && l == false
            v_index << (i +1) * -1
            l = true
        end
    end
    f_l = [v_index[0], v_index[-1]]
end

