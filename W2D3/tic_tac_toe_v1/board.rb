require "byebug"
class Board
    attr_reader :grid
    def initialize(dimensions=3)
        @grid = Array.new(dimensions) {Array.new(dimensions, "_")}
    end
    
    def valid?(position)
        unless @grid[position[0]][position[1]] == nil
            return true
        end
        false
    end

    def empty?(position)
       return true if @grid[position[0]][position[1]] == "_"
       false 
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end
    
    def place_mark(position, mark)
        if !valid?(position) || !empty?(position)
            raise RuntimeError.new "Unable to mark #{position}"
        end
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end 
    end

    # Win State Checks

    def win_row?
        @grid.each do |row|
            check = row[0]
            count = 0
            row.each do |ele|
                if 
                    ele == check && check != "_"
                    count += 1
                end
            end 
            return true if count == row.length
        end
        false
    end

    def win_col?
        j = 0
        @grid[0].each.with_index do |ele, idx|
            check = ele
            count = 0
            i = 0
            while i < @grid.length
                return false if @grid[i][idx] != "_"
                if @grid[i][idx] == check 
                    count += 1
                end
                i += 1
            end
            return true if count == @grid.length
        end
        false
    end

    def win_diagonal?
        
        opposite = []
        @grid.each { |row| opposite.unshift(row)}
        return true if self.diag_check == true || self.diag_check(opposite)
        false
    end

    def diag_check(b=@grid)
        i = 0
        j = 0
        if b[i][j] == "_"
            return false
        end
        check = b[0][0]
        count = 0
        while i < b.length
            return false if b[i][j] == "_"
            count += 1 if b[i][j] == check 
            i += 1
            j += 1
        end
        return true if count == b.length
    end
    false
end

b = Board.new
b.place_mark([2, 0], :X)
b.place_mark([1, 1], :X)
b.place_mark([0, 2], :X)
b.print
p b.diag_check
p b.win_diagonal?
b.print