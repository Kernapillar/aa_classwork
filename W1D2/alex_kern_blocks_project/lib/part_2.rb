require "byebug"

def all_words_capitalized?(words)
    eval = words.all? do |word|
        cap = word.capitalize
        if word != cap
            return false
        else
            true
        end
    end
    eval
end

def no_valid_url?(urls)
    correct_urls = [".com", ".net", ".io", ".org"]
    urls.none? do |url|
        if valid_url?(url)
            return false
        end
    end
end

def valid_url?(url)
    correct_urls = [".com", ".net", ".io", ".org"]
    correct_urls.each do |ending|
        if url.end_with?(ending)
            return true
        end
    end
    false
end

def any_passing_students?(students)
    students.each do |student|
        average_grade = (student[:grades].sum / student[:grades].length.to_f)
        student["avg_grade"] = average_grade
    end
    students.any? do |student| 
        if student["avg_grade"] >= 75
            return true
        end
    end
end

