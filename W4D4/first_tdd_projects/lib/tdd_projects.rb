

def my_uniq(arr)
    new_arr = []
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1 }
    hash.each_key {|key| new_arr << key}
    new_arr
end

class Array
    def two_sum
        new_arr = []
        i = 0
        while i < self.length
            j = 1
            while j < self.length
                if i < j && self[i] + self[j] == 0
                    new_arr << [i,j]
                end
                j += 1
            end
            i += 1
        end
        new_arr
    end
end

def my_transpose(matrix)
    raise "invalid matrix" if matrix[0].length != matrix.length
    new_matrix = []
    i = 0
    while i < matrix.length
        temp = []
        matrix.each do |row|   
            temp << row[i]
        end
        new_matrix << temp
        i += 1
    end
    new_matrix
end

def stock_picker(stocks)
    biggest_prof = 0
    best_days = [0,0]
    raise "invalid input" if !stocks.is_a?(Array)
    i = 0
    while i < stocks.length
        j = 1
        while j < stocks.length
            if i < j && stocks[j] - stocks[i] > biggest_prof
                best_days = [i, j]
                biggest_prof = stocks[j] - stocks[i]
            end
            j += 1
        end
        i += 1
    end
    return best_days
end

class Hanoi
    
    attr_accessor :arrays

    def initialize
        @arrays = [[1, 2, 3, 4], [], []]
        @number_of_pieces = 4
    end

    def move(start, ending)
        if @arrays[ending].length >=1
            if @arrays[ending][0] < @arrays[start][0]
                raise "invalid move"
            end
        else
            piece = @arrays[start].shift
            @arrays[ending].unshift(piece)
        end
    end
    
    def won?
        if @arrays[-1].length == @number_of_pieces
            return true
        elsif
            @arrays[1].length == @number_of_pieces
            return true
        end
        false
    end
    
    def play
        until won?
            print arrays
            puts
            puts "move a disk! (start index)"
            start = gets.chomp.to_i
            puts "where to? (end index)"
            ending = gets.chomp.to_i
            move(start, ending)
        end
    end
end
# h = Hanoi.new
# h.play