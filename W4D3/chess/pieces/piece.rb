

class Piece
    attr_reader :color, :current_pos, :board
    def initialize(board, current_pos, color)
        @board = board
        @current_pos = current_pos
        @color = color
    end

    def inspect 
        "#{symbol} "
    end

    def update_pos(pos)
        @current_pos = pos
    end

    def moves
    end
end