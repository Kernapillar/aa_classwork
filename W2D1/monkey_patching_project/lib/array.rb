# Monkey-Patch Ruby's existing Array class to add your own custom methods

class Array

    def span
        return nil if self.length == 0
        largest = self[0]
        smallest = self[0]
        self.each do |ele|
            if ele > largest
                largest = ele
            elsif ele < smallest
                smallest = ele
            end
        end
        largest - smallest
    end

    def average
        return self.sum / self.length.to_f if self.length != 0
    end

    def median
        arr_sorted = self.sort
        return nil if arr_sorted.length == 0
        middle_num = arr_sorted.length / 2
        if self.length.even? 
            total = arr_sorted[middle_num] + arr_sorted[middle_num -1] 
            return total / 2.0
        else
            return arr_sorted[middle_num]
        end
    end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    # Part 2

    def my_count(value)
        count = 0
        self.each {|ele| count += 1 if ele == value}
        count
    end

    def my_index(value)
        i = 0
        while i < self.length
            if self[i] == value
                return i
            end
            i += 1
        end
        nil
    end

    def my_uniq
        new_arr = []
        self.each {|ele| new_arr << ele unless new_arr.include?(ele)}
        new_arr
    end

    def my_transpose
        arr_len = self.length
        transposed_arr = Array.new(arr_len) { Array.new }
        i = 0
        while i < arr_len
            j = 0
            while j < arr_len
                transposed_arr[i] << self[j][i]
                j += 1
            end
            i += 1
        end
        transposed_arr
    end
end
