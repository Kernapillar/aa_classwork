

class Piece
    attr_reader :color, :board
    def initialize(board, current_pos, color)
        @board = board
        @current_pos = current_pos
        @color = color
    end

    def inspect 
        "color : #{color}"
    end

    def moves
    end

end