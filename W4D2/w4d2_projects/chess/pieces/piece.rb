

class Piece
    attr_reader :color, :symbol # :board
    def initialize(symbol, color)
    # def initialize(board, current_pos, color)
        # @board = board
        # @current_pos = current_pos
        @symbol = symbol
        @color = color
    end

    def inspect 
        "#{symbol} : #{color}"
    end

    def moves
    end
end