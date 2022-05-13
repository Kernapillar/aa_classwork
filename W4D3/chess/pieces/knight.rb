require_relative "piece"
require_relative "modules/stepable.rb"

class Knight < Piece
    include Stepable
    attr_reader :symbol
    def initialize(board, current_pos, color)
        super(board, current_pos, color)
        if @color == :white
            @symbol = :♘ 
        else
            @symbol = :♞
        end
    end


    def move_dir
        knight_move(current_pos)
    end
    
end