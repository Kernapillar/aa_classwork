class Board
  
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = (n*n)
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        arr = @grid.flatten
        count = 0
        arr.each {|ele| count += 1 if ele == :S}
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else 
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        ships = self.size / 4
        while self.num_ships < ships
            i = rand(0...@grid.length)
            j = rand(0...@grid.length)
            pos = [i, j]
            unless self[pos] == :S
                self[pos] = :S
            end
        end
    end

    def hidden_ships_grid
        temp_grid = Array.new(@grid.length) {Array.new(@grid.length, :N)}

        temp_grid.each.with_index do |row, i|
            row.each.with_index do |ele, j|
                if @grid[i][j] == :S
                    temp_grid[i][j] = :N
                else
                    temp_grid[i][j] = @grid[i][j]
                end
            end
        end
        temp_grid
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        self.class.print_grid(@grid)
    end

    def print
        self.class.print_grid(hidden_ships_grid)
    end

end

