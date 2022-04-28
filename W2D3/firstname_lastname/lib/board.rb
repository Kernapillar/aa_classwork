class Board

    def self.build_stacks(num)
        Array.new(num) {Array.new}
    end

    attr_reader :max_height

    def initialize(num, max_height)
        raise "rows and cols must be >= 4" if num < 4 || max_height < 4
        @max_height = max_height
        @stacks = self.class.build_stacks(num)
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < max_height
            @stacks[stack_index] << token 
            return true
        end
        false
    end
    
    def vertical_winner?(token)
        @stacks.each do |stack|
            if stack.all? {|t| t == token} && stack.length == max_height
                return true
            end
        end
        false
    end

    def horizontal_winner?(token)
        i = 0
        while i < max_height 
            row = []
            @stacks.each do |stack|
                row << stack[i]
            end
            if row.all? {|t| t == token}
                return true
            end
            i += 1
        end
        false
    end

    def winner?(token)
        vertical_winner?(token) || horizontal_winner?(token)
    end




    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
