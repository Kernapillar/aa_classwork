require_relative "piece"
require_relative "modules/stepable.rb"

class King < Piece
    include Stepable
    attr_reader :symbol
    def initialize(board, current_pos, color)
        super(board, current_pos, color)
        if @color == :white
            @symbol = :♔ 
        else
            @symbol = :♚
        end
    end


    def move_dir
        king_move(current_pos)
    end
    
end