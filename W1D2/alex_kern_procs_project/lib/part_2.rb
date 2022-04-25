require "byebug"

def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)    
    new_sentence = []
    sentence.split.each do |word|
        new_sentence << prc.call(word)
    end
    new_sentence.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    val_1 = prc_1.call(num)
    val_2 = prc_2.call(num)
    if val_1 > val_2
        val_1
    else
        val_2
    end
end

def and_selector(arr, prc_1, prc_2)
    new_arr = []
    arr.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def alternating_mapper(arr, prc_1, prc_2)
    new_arr = []
    arr.each.with_index do |ele, i|
        if i.even?
            new_arr << prc_1.call(ele)
        else
            new_arr << prc_2.call(ele)
        end

    end
    new_arr
end