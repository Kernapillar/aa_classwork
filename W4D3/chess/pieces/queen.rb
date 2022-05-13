require_relative "piece"
require_relative "modules/slideable.rb"

class Queen < Piece
    include Slideable
    attr_reader :symbol
    def initialize(board, current_pos, color)
        super(board, current_pos, color)
        if @color == :white
            @symbol = :♕ 
        else
            @symbol = :♛
        end
    end


    def move_dir
        straight_line(current_pos) + diagonal(current_pos)
    end
    
end