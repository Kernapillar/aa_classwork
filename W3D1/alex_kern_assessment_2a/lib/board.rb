require "byebug"

class Board

    attr_reader :size

    def initialize(num)
        @size = num
        @grid = Array.new(num) {Array.new(num, [])}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, mark)
        @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            return true if row.length == @size && row.all? {|ele| ele == mark}
        end
        false
    end

    def complete_col?(mark)
        i = 0
        while i < @size 
            j = 0
            count = 0
            while j < @size
                if @grid[j][i] == mark
                    count += 1
                end
                j += 1
            end
            return true if count == @size
            i += 1
        end
        false
    end

    def complete_diag?(mark)
        reverse_grid = @grid.reverse
        return true if diag_helper(mark, @grid) || diag_helper(mark, reverse_grid)
        false
    end

    def diag_helper(mark, grid)
        i = 0
        count = 0
        while i < grid.length
            if grid[i][i] == mark
                count += 1
            end
            i += 1
        end
        return true if count == grid.length
        false
    end

    def winner?(mark)
        return true if complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
        false
    end




    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
