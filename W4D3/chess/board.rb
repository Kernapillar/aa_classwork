require_relative "pieces/rook.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/king.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/bishop.rb"
require_relative "pieces/null_piece.rb"


class Board
    
    def initialize
        @null_piece = NullPiece.instance
        @board = Array.new(8) {Array.new(8, @null_piece)}
        self.fresh_board
    end

    def fresh_board
        start_positions = {R:[[0, 0], [0, 7], [7, 0], [7, 7]], N:[[0, 1], [0, 6], [7, 1], [7, 6]], B:[[0, 2], [0, 5], [7, 2], [7, 5]], K:[[0, 3], [7, 3]], Q:[[0, 4], [7, 4]]}
        start_positions.each do |piece, positions|
            positions.each do |pos|
                i, j = pos
                if i == 0 || i == 1
                    color = :white
                else
                    color = :black
                end
                case piece
                when :R
                    board[i][j] = Rook.new(self, [i, j], color)
                when :N
                    board[i][j] = Knight.new(self, [i, j], color)
                when :B
                    board[i][j] = Bishop.new(self, [i, j], color)
                when :K
                    board[i][j] = King.new(self, [i, j], color)
                when :Q
                    board[i][j] = Queen.new(self, [i, j], color)
                end
            end
        end

        

        (0..7).each do |i|
            board[1][i] = Pawn.new(self, [1, i], :white) 
            board[6][i] = Pawn.new(self, [6, i], :black)
            (2..5).each do |j|
                board[j][i] = null_piece
            end
        end
        puts "board has been reset"
    end

    def print
        board.each do |row|
            row.each do |piece|
                print "#{piece.symbol} "
            end
            puts
        end
    end

    def [](pos) 
        i, j = pos
        board[i][j]
    end

    def []=(pos, val)
        i, j = pos
        board[i][j] = val
    end

    def move_piece(start_pos, end_pos)
        raise "no piece at position: #{start_pos}" if self[start_pos] == null_piece
        possible_moves = self[start_pos].move_dir
        raise "invalid position" if !possible_moves.include?(end_pos)
        raise "invalid end pos: #{end_pos}" if !valid_pos?(end_pos)
        current_piece = self[start_pos]
        self[end_pos] = current_piece
        self[start_pos] = null_piece
        self[end_pos].update_pos(end_pos)
        
    end

    def valid_pos?(pos)
        return false if !pos[0].between?(0,7)
        
        return false if !pos[1].between?(0,7)
        return true
    end

    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
        king_pos = find_king(color)

        self.each do |row|
            row.each do |piece|
                attack_pos = piece.move_dir
                return true if attack_pos.include?(king_pos)
            end
        end
        return false
    end

    def find_king(color)
        self.each do |row|
            row.each do |piece|
                if piece.color == color && (piece.symbol == :♔  || piece.symbol == :♚)
                    return piece.current_pos
                end
            end
        end
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end


    attr_reader :board, :null_piece

end