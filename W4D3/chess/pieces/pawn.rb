require_relative "piece"

class Pawn < Piece
    attr_reader :symbol, :color, :current_pos
    def initialize(board, current_pos, color)
        super(board, current_pos, color)
        if @color == :white
            @symbol = :♙ 
        else
            @symbol = :♟
        end
    end

    def at_start_row?
        if color == :black && current_pos[0] == 6
            return true
        elsif color == :white && current_pos[0] == 1
            return true
        end
        false
    end

    def move_dir
        pos = current_pos
        arr = pawn_move
        valid_moves = []
        arr.each do |move|
            end_pos = [pos[0] + move[0], pos[1] + move[1]]
            if move[0].abs == 2
                if board[[end_pos[0]-1, end_pos[1]]].color == nil && self.color == :white
                    valid_moves << end_pos
                elsif board[[end_pos[0]+1, end_pos[1]]].color == nil && self.color == :black
                    valid_moves << end_pos
                end
            elsif board[end_pos].color != self.color && board[end_pos].color != nil
                if move[1] != 0
                    valid_moves << end_pos
                end
            elsif board[end_pos].color == nil
                if move[1] == 0
                    valid_moves << end_pos
                end
            end
        end
        return valid_moves
    end

    def pawn_move
        if color == :black && at_start_row?
            move_step = [[-1, 0], [-2, 0], [-1, 1], [-1,-1]]
        elsif color == :white && at_start_row?
            move_step = [[1, 0], [2, 0], [1,1], [1,-1]]
        elsif color == :black 
            move_step = [[-1, 0], [-1, -1], [-1, 1]]
        elsif color == :white
            move_step = [[1, 0], [1, -1], [1, 1]]
        end
        return move_step
    end


end