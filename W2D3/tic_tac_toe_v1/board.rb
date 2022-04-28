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
        begin
            if !valid?(position) || !empty?(position)
                raise RuntimeError.new "Unable to mark #{position}"
            end
        rescue 
            puts "please try again"
            retry
        end
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end 
    end

    # Win State Checks

    def win_row?(mark)
        @grid.each do |row|
            check = mark
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

    def win_col?(mark)
        @grid[0].each.with_index do |ele, idx|
            check = mark
            count = 0
            i = 0
            while i < @grid.length
                return false if @grid[i][idx] == "_"
                if @grid[i][idx] == check 
                    count += 1
                end
                i += 1
            end
            return true if count == @grid.length
        end
        false
    end

    def win_diagonal?(mark)
        
        opposite = []
        @grid.each { |row| opposite.unshift(row)}
        return true if self.diag_check(mark) == true || self.diag_check(mark, opposite)
        false
    end

    def diag_check(mark, b=@grid)
        i = 0
        if b[i][i] == "_"
            return false
        end
        check = mark
        count = 0
        while i < b.length
            return false if b[i][i] == "_"
            count += 1 if b[i][i] == check 
        end
        return true if count == b.length
        false
    end

    def win?(mark)
        if win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
            return true
        end
        false
    end

    def empty_positions?
        flat = @grid.flatten
        flat.each {|ele| return true if ele == "_"}
        false
    end

end


# def diagonal_win?(mark)
#     reverse_grid = @grid.reverse # creating a reversed version of the grid:

#     #  [[_ _ X],    ->  [[X _ _],
#     #   [_ X _],    ->   [_ X _],
#     #   [X _ _]]    ->   [_ _ X]]


#     if diagonal_helper(mark) || diagonal_helper(mark, reverse_grid)
#         return true
#     else
#         return false
#     end

# end

# def diagonal_helper(mark, grid=@grid)
# # return true if the top left -> bottom rightupd diagonal 
# # is a win for mark on the grid. 
# # optional grid variable, defaults to the current instance grid
# end