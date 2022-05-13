require_relative "piece"
require_relative "modules/slideable.rb"

class Bishop < Piece
    include Slideable
    attr_reader :symbol
    def initialize(board, current_pos, color)
        super(board, current_pos, color)
        if @color == :white
            @symbol = :♗ 
        else
            @symbol = :♝
        end
    end


    def move_dir
        diagonal(current_pos)
    end
    
end