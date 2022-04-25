require "byebug"

# Phase 1: Modest Problems

def duos(str)
    count = 0
    if str.length < 2 
        return count
    end
    (0...str.length - 1).each do |i|
        if str[i] == str[i+1]
            count += 1
        end
        i += 1
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    new_sent = []
    words = sent.split
    words.each do |word|
        if hash.include?(word)
            new_sent << hash[word]
        else
            new_sent << word
        end
    end
    new_sent.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, prc, &blc)
    new_hash = {}
        hash.each do |k, v|
            new_hash[blc.call(k)] = prc.call(v)
        end
    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters(str)
    hash = Hash.new(0)
    str.each_char {|char| hash[char] += 1}
    arr = []
    hash.each {|k, v| arr << k if v >2}
    arr
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(str)
    if str.length < 3
        return false
    end
    (0...str.length - 2).each do |i|
        return true if str[i] == str[i+1] && str[i] == str[i+2]
    end
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    new_str = ""
    str.each_char do |char|
        if char == " "
            new_str << char
        elsif hash.include?(char)
            new_str << hash[char]
        else
            new_str << "?"
        end
    end
    new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    new_str = ""
    i = 0
    while i < str.length
        new_str << str[i] * str[i+1].to_i
        i += 2
    end
    new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Phase 2: More difficult, maybe?

def conjunct_select(arr, *prc)
    new_arr = []
    arr.each do |ele|
        t = true
        prc.each do |p|
           if !p.call(ele)
            t = false
           end 
        end
        if t
            new_arr << ele
        end
    end
    new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
    words = sent.split
    new_sent = []
    vowels = "aeiou"
    words.each do |word|
        if word[0] == word[0].upcase 
            cap = true
        else
            cap = false
        end
        word = word.downcase
        if word.length <= 3
            new_sent << word
        else
            if vowels.include?(word[0])
                if cap == true
                    new_sent << word.capitalize + "yay"
                else
                    new_sent << word + "yay"
                end
            else
                new_word = word[first_vowel(word)..-1] + word[0...first_vowel(word)] + "ay"
                if cap
                    new_sent << new_word.capitalize
                else
                    new_sent << new_word
                end
                
            end
        end
    end
    new_sent.join(" ")
end

def first_vowel(word)
    vowels = "aeiou"
    word.each_char {|char| return word.index(char) if vowels.include?(char)}
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    vowels = "aeiou"
    new_sent = []
    words = sent.split
    words.each do |word|
        if word.length < 3
            new_sent << word
        elsif vowels.include?(word[-1])
            new_sent << word + word
        else
            new_sent << word + word[first_last_vowel(word)[1]..-1]
        end
    end
    new_sent.join(" ")
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

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |ele|
        prcs.each do |prc|
            if prc.call(ele)
                new_arr << ele
                break
            end
        end
    end
    new_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    words = sent.split
    new_sent = []
    vowels = "aeiou"
    words.each.with_index do |word, i|
        has_vowels = false
        word.each_char do |char|
            if vowels.include?(char)
                has_vowels = true
            end
        end
        if has_vowels
            if i.even?
                new_word = remove_letter(word, first_last_vowel(word)[0])
                new_sent << new_word 
            else
            new_word = remove_letter(word, first_last_vowel(word)[1])
                new_sent << new_word
            end
        else
            new_sent << word
        end
    end
    new_sent.join(" ")
end

def remove_letter(word, i)
    let = word.split("")
    let.delete_at(i)
    let.join
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    words = sent.split
    new_sent = []
    vowels = "aeiou"
    words.each do |word|
        if vowels.include?(word[-1])
            new_sent << word + word[-1]
        else
            new_word = ""
            word.each_char do |char|
               if vowels.include?(char)
                new_word += char + "b" + char
               else
                new_word += char
               end
            end
            new_sent << new_word
        end
    end
    new_sent.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(str)
    comp_str = ""
    i = 0
    
    while i < str.length
        current = str[i]
        count = 0
        while current == str[i]
            count += 1
            i += 1
        end
        if count > 1
            comp_str += current + count.to_s
        else
            comp_str += current
        end

    end
    comp_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"


def test_func(arr, num)

end